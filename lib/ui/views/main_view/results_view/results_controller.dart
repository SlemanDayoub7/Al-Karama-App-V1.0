import 'package:al_karama_app/core/data/models/match_model.dart';
import 'package:al_karama_app/core/data/models/seasone_model.dart';
import 'package:al_karama_app/core/data/models/standing_model.dart';
import 'package:al_karama_app/core/data/repository/match_repository.dart';
import 'package:al_karama_app/core/data/repository/results_repository.dart';
import 'package:al_karama_app/core/translation/app_translation.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_toast.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class ResultsController extends GetxController {
  RxBool showAll = false.obs;
  RxInt selectedDate = 0.obs;
  RxString selectedSeasonsId = "".obs;
  bool haveWrong = false;
  RxString selectedSeasonsName = "".obs;
  RxBool isLoading = false.obs;
  RxList<SeasoneModel> seasons = <SeasoneModel>[].obs;
  Rx<StandingModel> standing = StandingModel().obs;
  Rx<MatchModel> matches = MatchModel().obs;

  CarouselSliderController carouselController = CarouselSliderController();
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
    seasons.clear();
    standing.value = StandingModel();
    matches.value = MatchModel();
    await MatchRepository().getFinishedMatch().then(
      (value) {
        value.fold((l) => haveWrong = true, (r) => matches.value = r);
      },
    );

    await ResultsRepository().getSeasons().then((value) =>
        value.fold((l) => haveWrong = true, (r) => seasons.value = r));

    if (seasons.length > 0) {
      selectedSeasonsId.value = seasons.value[0].uuid ?? "";
      selectedSeasonsName.value = seasons.value[0].name ?? "";
      await getCustomStanding(selectedSeasonsId.value);
    }
    if (haveWrong) {
      CustomToast.showMeassge(message: tr("key_wrong_message"));
    }
    isLoading.value = haveWrong = false;
  }

  getCustomStanding(String seasoneId) async {
    if (!isOnline) {
      CustomToast.showMeassge(message: "No Internet");
      return;
    }
    isLoading.value = true;
    await ResultsRepository().getStanding(seasoneId).then((value) =>
        value.fold((l) => haveWrong = true, (r) => standing.value = r));

    if (haveWrong) {
      CustomToast.showMeassge(message: tr("key_wrong_message"));
    }
    isLoading.value = haveWrong = false;
  }

  moveToRight() {
    carouselController.nextPage();
  }

  moveToLeft() {
    carouselController.previousPage();
  }
}
