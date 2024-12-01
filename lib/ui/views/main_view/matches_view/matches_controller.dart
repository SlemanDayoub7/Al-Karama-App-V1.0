import 'package:al_karama_app/core/data/models/match_model.dart';
import 'package:al_karama_app/core/data/repository/match_repository.dart';
import 'package:al_karama_app/core/translation/app_translation.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_toast.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/match_detail_view/match_detail_controller.dart';
import 'package:al_karama_app/ui/views/match_detail_view/match_detail_view.dart';
import 'package:get/get.dart';

class MatchesController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxBool _haveWrong = false.obs;
  final Rx<MatchModel> _matches = MatchModel().obs;
  final Rx<MatchModel> _finishedMatches = MatchModel().obs;

  bool get isLoading => _isLoading.value;
  bool get haveWrong => _haveWrong.value;
  MatchModel get matches => _matches.value;
  MatchModel get finishedMatches => _finishedMatches.value;

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  void goToMatchDetail(Football football) {
    Get.to(MatchDetailView(football: football));
  }

  Future<void> getData() async {
    if (!isOnline) {
      CustomToast.showMeassge(message: tr("key_no_internet"));
      return;
    }

    _isLoading.value = true;
    _matches.value = MatchModel();
    _finishedMatches.value = MatchModel();

    final matchesResult = await MatchRepository().getMatches();
    final finishedMatchesResult = await MatchRepository().getFinishedMatch();

    _isLoading.value = false;

    if (matchesResult.isLeft() || finishedMatchesResult.isLeft()) {
      _haveWrong.value = true;
      CustomToast.showMeassge(message: tr("key_wrong_message"));
    } else {
      _matches.value = matchesResult.getOrElse(() => MatchModel());
      _finishedMatches.value =
          finishedMatchesResult.getOrElse(() => MatchModel());
    }
  }
}
