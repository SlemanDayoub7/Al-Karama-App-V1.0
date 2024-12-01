import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/museum_model.dart';
import 'package:al_karama_app/core/data/repository/museum_repository.dart';
import 'package:al_karama_app/core/translation/app_translation.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_toast.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:get/get.dart';

class MuseumController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxBool _haveWrong = false.obs;
  Rx<MuseumModel> _musemum = MuseumModel().obs;
  final RxList<BestGoals> _bestGoals = <BestGoals>[].obs;
  final RxList<Primes> _primesPlayers = <Primes>[].obs;
  final RxList<Primes> _primesClub = <Primes>[].obs;
  final RxList<String> _imagesUrl = <String>[].obs;

  MuseumModel get musemum => _musemum.value;
  bool get haveWrong => _haveWrong.value;
  List<BestGoals> get bestGoals => _bestGoals;
  List<Primes> get primesPlayers => _primesPlayers;
  List<Primes> get primesClub => _primesClub;
  List<String> get imagesUrl => _imagesUrl;

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  Future<void> getData() async {
    if (!isOnline) {
      CustomToast.showMeassge(message: tr("key_no_internet"));
      return;
    }
    isLoading.value = true;
    _musemum.value = MuseumModel();
    _primesPlayers.clear();
    _primesClub.clear();
    _bestGoals.clear();
    final Either<dynamic, MuseumModel> result =
        await MuseumRepository().getMuseum();
    _haveWrong.value = result.fold((l) => true, (r) => false);
    if (!_haveWrong.value) {
      _musemum.value = result.getOrElse(() => MuseumModel());
      _musemum.value.primes?.forEach((element) {
        element.type == 'personal'
            ? _primesPlayers.add(element)
            : _primesClub.add(element);
      });
      _musemum.value.bestGoals?.forEach((element) {
        _imagesUrl.add(getImageOfVideo(element.url ?? ""));
      });
    } else {
      CustomToast.showMeassge(message: tr("key_some_thing_wrong"));
    }
    isLoading.value = _haveWrong.value = false;
  }
}
