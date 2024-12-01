import 'package:al_karama_app/core/data/models/stuff_model.dart';
import 'package:al_karama_app/core/data/repository/stuff_repository.dart';
import 'package:al_karama_app/core/translation/app_translation.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_toast.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:get/get.dart';

class StuffController extends GetxController {
  RxBool isLoading = false.obs;
  bool haveWrong = false;
  DateTime dateTime = DateTime.now();
  RxString currentSeason = ''.obs;
  Rx<StuffModel> stuff = StuffModel().obs;
  @override
  void onInit() async {
    super.onInit();
    await getData();
    currentSeason.value =
        (dateTime.year - 1).toString() + '-' + dateTime.year.toString();
  }

  Future<void> getData() async {
    if (!isOnline) {
      CustomToast.showMeassge(message: tr("key_no_internet"));
      return;
    }
    isLoading.value = true;
    stuff.value = StuffModel();
    await StuffRepository().getStuff().then((value) => value.fold(
        (l) => CustomToast.showMeassge(message: tr("key_some_thing_wrong")),
        (r) => stuff.value = r));
    isLoading.value = false;
  }

  bool isStuffEmpty(StuffModel model) {
    int check = 0;
    if (model.boss == null ||
        model.boss!.uuid == null ||
        model.boss!.name == null ||
        model.boss!.startYear == null ||
        model.boss!.image == null) {
      check++;
    }
    if ((model.attack == null || model.attack!.isEmpty) &&
        (model.middle == null || model.middle!.isEmpty) &&
        (model.defence == null || model.defence!.isEmpty) &&
        (model.goalKeepers == null || model.goalKeepers!.isEmpty) &&
        (model.managers == null || model.managers!.isEmpty) &&
        (model.coaches == null || model.coaches!.isEmpty)) {
      check++;
    }
    if (model.wears == null ||
        model.wears!.uuid == null ||
        model.wears!.image == null) {
      check++;
    }
    return check == 3;
  }
}
