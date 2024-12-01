import 'package:al_karama_app/core/data/models/sports_model.dart';
import 'package:al_karama_app/core/data/repository/sports_repository.dart';
import 'package:al_karama_app/core/translation/app_translation.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_toast.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/main_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../../core/enums/connectivityStatus.dart';

class LandingController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool haveWrong = false.obs;
  RxBool isOffline = false.obs;
  RxList<SportsModel> sports = <SportsModel>[].obs;
  Connectivity connectivity = Connectivity();
  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  getData() async {
    /* ConnectivityStatus status =
        connectivitySerivce.getStatus(await connectivity.checkConnectivity());
    isOnline = status == ConnectivityStatus.ONLINE;
    isOffline.value = haveWrong.value = false;*/
    isLoading.value = true;
    if (!isOnline) {
      isOffline.value = haveWrong.value = true;
      isLoading.value = false;
      return;
    }
    sports.clear();
    await SportsRepository().getSports().then(
      (value) {
        value.fold((l) => haveWrong.value = true, (r) => sports.value = r);
      },
    );

    if (haveWrong.value) {
      CustomToast.showMeassge(message: tr("key_some_thing_wrong"));
    } else {
      if (sports.length > 0) {
        if (sports[0].uuid != null) {
          storage.setSportType(sports[0].uuid!);
          Get.off(() => MainView());
        }
      }
    }
    isLoading.value = false;
  }
}
