import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/views/landing_view/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LandingView extends StatelessWidget {
  LandingView({super.key});
  LandingController controller = Get.put(LandingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(children: [
        SizedBox.expand(
          child: Image.asset(
            "assets/images/pngs/splash_image.png",
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/svgs/logo.svg",
                  fit: BoxFit.cover,
                  width: screenWidth(1.5),
                  height: screenWidth(1.5),
                ),
                SizedBox(
                  height: screenWidth(20),
                ),
                controller.isOffline.value
                    ? CustomText(
                        text: "أنت غير متصل بالانترنت",
                        styleType: TextStyleType.TITLE,
                        textColor: AppColors.whiteColor,
                      )
                    : SizedBox(),
                SizedBox(
                  height: screenWidth(20),
                ),
                controller.haveWrong.value
                    ? SizedBox(
                        height: screenWidth(8),
                        width: screenWidth(2),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.whiteColor),
                                foregroundColor: MaterialStatePropertyAll(
                                    AppColors.blackColor)),
                            onPressed: () async {
                              await controller.getData();
                            },
                            child: CustomText(text: "أعد المحاولة")),
                      )
                    : SizedBox(),
                SizedBox(
                  height: screenWidth(20),
                ),
                controller.isLoading.value
                    ? SpinKitCircle(
                        color: AppColors.whiteColor,
                        size: screenWidth(7),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
