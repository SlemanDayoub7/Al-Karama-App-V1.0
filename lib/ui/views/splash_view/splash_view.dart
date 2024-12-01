import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/main_view.dart';
import 'package:al_karama_app/ui/views/splash_view/splash_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  splashController controller = Get.put(splashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueColorOne,
    );
  }
}
