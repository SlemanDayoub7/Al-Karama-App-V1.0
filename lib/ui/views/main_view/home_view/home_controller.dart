import 'package:al_karama_app/core/data/models/banner_model.dart';
import 'package:al_karama_app/core/data/models/news_model.dart';
import 'package:al_karama_app/core/data/models/next_match_model.dart';
import 'package:al_karama_app/core/data/models/sports_model.dart';
import 'package:al_karama_app/core/data/repository/news_repository.dart';
import 'package:al_karama_app/core/data/repository/next_match_repository.dart';
import 'package:al_karama_app/core/data/repository/sports_repository.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/details_news_view/details_news_view.dart';
import 'package:get/get.dart';
import '../../../../core/translation/app_translation.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isRefresh = false.obs;
  bool haveWrong = false;
  RxInt selectedSport = 0.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxList<SportsModel> sports = <SportsModel>[].obs;
  RxList<NewsModel> news = <NewsModel>[].obs;
  Rx<NextMatchModel> nextMatch = NextMatchModel().obs;
  RxList<String> imagesUrl = <String>[].obs;
  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  openCustomeNews(int index) {
    imagesUrl.clear();
    if (news[index].videos != null) if (news[index].videos!.length > 0)
      news[index].videos!.forEach((element) {
        imagesUrl.add(getImageOfVideo(element.url ?? ""));
      });
    Get.to(() => DetailsNewsView(newsModel: news[index], imagesUrl: imagesUrl));
  }

  selectSport(String sportId) {
    int selectedIndex = sports.indexWhere((element) => element.uuid == sportId);
    selectedSport.value = selectedIndex;
    storage.setSportType(sportId);
    CustomToast.showMeassge(message: tr("key_refresh_please"));
  }

  Future<void> getData() async {
    if (!isOnline) {
      CustomToast.showMeassge(message: tr("key_no_internet"));
      return;
    }

    isLoading.value = true;
    news.clear();
    sports.clear();
    banners.clear();
    nextMatch.value = NextMatchModel();
    await SportsRepository().getSports().then(
      (value) {
        value.fold((l) => haveWrong = true, (r) => sports.value = r);
      },
    );
    await NewsRepository().getAllNews().then(
        (value) => value.fold((l) => haveWrong = true, (r) => news.addAll(r)));
    await NextMatchRepository().getNextMatch().then((value) =>
        value.fold((l) => haveWrong = true, (r) => nextMatch.value = r));
    await NewsRepository().getBanners().then((value) =>
        value.fold((l) => haveWrong = true, (r) => banners.value = r));
    if (haveWrong) {
      CustomToast.showMeassge(message: tr("key_some_thing_wrong"));
    }

    isLoading.value = haveWrong = false;
  }
}
