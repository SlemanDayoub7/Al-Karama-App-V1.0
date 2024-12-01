import 'package:al_karama_app/core/enums/shimmer_type.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_shimmer.dart';
import 'package:al_karama_app/ui/views/player_detail_view.dart/player_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PlayerDetailView extends StatelessWidget {
  final PlayerController controller;
  final String id;
  PlayerDetailView({super.key, required this.id})
      : controller = Get.put(PlayerController(playerId: id));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => controller.isLoading.value
            ? CustomShimmer(
                shimmerType: ShimmerType.CUSTOM,
                widget: Center(
                  child: Container(
                    margin: EdgeInsets.all(screenWidth(50)),
                    width: screenWidth(1),
                    height: screenHeight(1),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                ),
              )
            : Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child:
                          /* Image.asset(
                      "assets/images/pngs/cris.jpg",
                      width: screenHeight(4),
                      height: screenWidth(1.4),
                      fit: BoxFit.fill,
                    ),*/
                          CustomImage(
                        url: controller.playerDetail.value.image ?? "",
                        width: screenHeight(4),
                        height: screenWidth(1.2),
                        fit: BoxFit.fill,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: screenWidth(1.3)),
                    width: screenWidth(1),
                    decoration: BoxDecoration(
                        color: AppColors.blueColorOne,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    height: screenHeight(1),
                    child: SingleChildScrollView(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth(40)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenWidth(30),
                          ),
                          CustomText(
                            text: controller.playerDetail.value.name ?? "",
                            styleType: TextStyleType.TITLE,
                            textColor: AppColors.whiteColor,
                          ),
                          SizedBox(
                            height: screenWidth(20),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    CustomText(
                                      text: "البلد الأم ",
                                      styleType: TextStyleType.TITLE,
                                      textColor: AppColors.whiteColor,
                                    ),
                                    SizedBox(
                                      height: screenWidth(40),
                                    ),
                                    CustomText(
                                      text:
                                          controller.playerDetail.value.from ??
                                              "",
                                      textColor: AppColors.whiteColor,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CustomText(
                                      text: "المواليد",
                                      styleType: TextStyleType.TITLE,
                                      textColor: AppColors.whiteColor,
                                    ),
                                    SizedBox(
                                      height: screenWidth(40),
                                    ),
                                    CustomText(
                                      text:
                                          controller.playerDetail.value.born ??
                                              "",
                                      textColor: AppColors.whiteColor,
                                    ),
                                  ],
                                ),
                              ]),
                          SizedBox(
                            height: screenWidth(20),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: "الطول",
                                    textColor: AppColors.whiteColor,
                                    styleType: TextStyleType.TITLE,
                                  ),
                                  SizedBox(
                                    height: screenWidth(40),
                                  ),
                                  CustomText(
                                    text: controller.playerDetail.value.high ??
                                        "",
                                    textColor: AppColors.whiteColor,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: "المركز",
                                    styleType: TextStyleType.TITLE,
                                    textColor: AppColors.whiteColor,
                                  ),
                                  SizedBox(
                                    height: screenWidth(40),
                                  ),
                                  CustomText(
                                      textColor: AppColors.whiteColor,
                                      text:
                                          controller.playerDetail.value.play ??
                                              "")
                                ],
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: "الرقم",
                                    textColor: AppColors.whiteColor,
                                    styleType: TextStyleType.TITLE,
                                  ),
                                  SizedBox(
                                    height: screenWidth(40),
                                  ),
                                  CustomText(
                                    text:
                                        controller.playerDetail.value.number ??
                                            "",
                                    textColor: AppColors.whiteColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenWidth(20),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: CustomText(
                              text: "- المسيرة الاحترافية",
                              styleType: TextStyleType.TITLE,
                              textColor: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(
                            height: screenWidth(20),
                          ),
                          CustomText(
                            text: (controller.playerDetail.value.career ?? ""),
                            styleType: TextStyleType.BODY,
                            textColor: AppColors.whiteColor,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    )),
                  )
                ],
              ),
      ),
      appBar: CustomAppBar(title: "معلومات اللاعب"),
    ));
  }
}
