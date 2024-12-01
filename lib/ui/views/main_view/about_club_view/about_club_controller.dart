import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/events_model.dart';
import 'package:al_karama_app/core/data/models/museum_model.dart';
import 'package:al_karama_app/core/data/models/news_model.dart';
import 'package:al_karama_app/core/data/models/next_match_model.dart';
import 'package:al_karama_app/core/data/repository/museum_repository.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:get/get.dart';

import '../../../../core/translation/app_translation.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

class AboutClubController extends GetxController {
  final _musemum = MuseumModel().obs;
  final _haveWrong = false.obs;

  bool get isLoading => _haveWrong.value;
  MuseumModel get musemum => _musemum.value;

  @override
  Future<void> onInit() async {
    await getData();

    super.onInit();
  }

  Future<void> getData() async {
    if (!isOnline) {
      CustomToast.showMeassge(message: tr("key_no_internet"));
      return;
    }

    _haveWrong.value = true;
    _musemum.value = MuseumModel();
    final result = await MuseumRepository().getMuseum();
    _haveWrong.value = result.fold((l) => true, (r) => false);
    if (_haveWrong.value) {
      CustomToast.showMeassge(message: tr("key_wrong_message"));
    } else {
      _musemum.value = result.getOrElse(() => MuseumModel());
    }
    _haveWrong.value = false;
  }
}
