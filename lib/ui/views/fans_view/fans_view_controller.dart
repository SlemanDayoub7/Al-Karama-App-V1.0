import 'package:al_karama_app/core/data/models/fans_model.dart';
import 'package:al_karama_app/core/data/repository/fans_repository.dart';
import 'package:al_karama_app/core/translation/app_translation.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_toast.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:get/get.dart';

class fansController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<FansModel> fans = <FansModel>[].obs;
  bool haveWrong = false;
  RxList<String> imagesUrl = <String>[].obs;
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
    fans.clear();
    await FansRepository().getFans().then(
        (value) => value.fold((l) => haveWrong = true, (r) => fans.value = r));
    if (haveWrong) {
      CustomToast.showMeassge(message: tr("key_some_thing_wrong"));
    } else {
      imagesUrl.clear();
      if (fans.length != 0) if (fans[0].videos !=
          null) if (fans[0].videos!.length > 0)
        fans[0].videos!.forEach((element) {
          imagesUrl.add(getImageOfVideo(element.url ?? ""));
        });
    }
    isLoading.value = haveWrong = false;
  }
}
