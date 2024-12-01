import 'package:al_karama_app/core/data/models/match_detail_model.dart';
import 'package:al_karama_app/core/data/repository/match_repository.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:get/get.dart';

import '../../../core/translation/app_translation.dart';
import '../../shared/custom_widgets/custom_toast.dart';

class matchDetailController extends GetxController {
  RxInt selectedTab = 0.obs;
  RxBool isLoading = true.obs;
  bool haveWrong = false;
  String matchId = '';
  Rx<MatchDetailModel> match = MatchDetailModel().obs;
  List<String> tabs = ["خطة الفريق", "التبديلات", "الاحتياط"];
  matchDetailController({required this.matchId});
  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  getData() async {
    if (!isOnline) {
      CustomToast.showMeassge(message: tr("key_no_internet"));
      return;
    }
    isLoading.value = true;
    match.value = MatchDetailModel();
    await MatchRepository().getMatcheDetail(matchId).then(
        (value) => value.fold((l) => haveWrong = true, (r) => match.value = r));
    if (haveWrong) {
      CustomToast.showMeassge(message: tr("key_some_thing_wrong"));
    }
    isLoading.value = haveWrong = false;
  }
}
