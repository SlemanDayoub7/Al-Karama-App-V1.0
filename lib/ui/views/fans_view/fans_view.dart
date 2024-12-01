import 'package:flutter/material.dart';
import 'package:al_karama_app/core/enums/shimmer_type.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_shimmer.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/fans_view/fans_view_controller.dart';
import 'package:get/get.dart';

import '../../shared/custom_widgets/custom_image.dart';

class FansView extends StatelessWidget {
  FansView({super.key});
  fansController controller = Get.put(fansController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(title: "رابطة المشجعين"),
            body: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth(40), right: screenWidth(40)),
              child: RefreshIndicator(
                color: AppColors.blueColorOne,
                onRefresh: () async {
                  await controller.getData();
                },
                child: ListView(
                  children: [
                    Obx(() => !controller.isLoading.value &&
                            controller.fans.value.length == 0
                        ? Container(
                            height: screenWidth(3),
                            child: Center(
                              child: CustomText(text: "لا يوجد بيانات"),
                            ),
                          )
                        : SizedBox()),
                    SizedBox(height: screenWidth(20)),
                    Obx(() => controller.isLoading.value
                        ? CustomShimmer(
                            shimmerType: ShimmerType.CUSTOM,
                            widget: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(25)),
                              height: screenWidth(1.8),
                              width: screenWidth(1),
                            ),
                          )
                        : controller.fans.length == 0
                            ? SizedBox()
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: CustomImage(
                                  url: controller.fans[0].image ?? "",
                                  height: screenWidth(1.8),
                                  width: screenWidth(1),
                                  fit: BoxFit.cover,
                                ),
                              )),
                    SizedBox(
                      height: screenWidth(20),
                    ),
                    Obx(() => controller.fans.length == 0
                        ? SizedBox()
                        : controller.fans[0].boss != null &&
                                controller.fans[0].members != null
                            ? CustomText(
                                text: "رابطة مشجعي نادي الكرامة",
                                styleType: TextStyleType.CUSTOMTITLE,
                              )
                            : SizedBox()),
                    SizedBox(height: screenWidth(20)),
                    Obx(() => controller.isLoading.value
                        ? CustomShimmer(
                            shimmerType: ShimmerType.CUSTOM,
                            widget: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(25)),
                              height: screenWidth(1.8),
                              width: screenWidth(1),
                            ),
                          )
                        : controller.fans.length == 0
                            ? SizedBox()
                            : controller.fans[0].boss != null &&
                                    controller.fans[0].members != null
                                ? Container(
                                    padding: EdgeInsets.only(
                                        left: screenWidth(20),
                                        right: screenWidth(20)),
                                    width: screenWidth(1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColors.blueColorOne),
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: screenWidth(60),
                                                  right: screenWidth(60)),
                                              child: Image.asset(
                                                "assets/images/pngs/karama.png",
                                                width: screenWidth(10),
                                                height: screenWidth(10),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: screenWidth(50)),
                                                    width: screenWidth(30),
                                                    height: screenWidth(30),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          AppColors.orangeColor,
                                                    ),
                                                  ),
                                                  CustomText(
                                                    text: "رئيس الرابطة",
                                                    textColor:
                                                        AppColors.whiteColor,
                                                    styleType:
                                                        TextStyleType.SUBTITLE,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: screenWidth(50)),
                                                    width: screenWidth(30),
                                                    height: screenWidth(30),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          AppColors.orangeColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              CustomText(
                                                text: controller.fans[0].boss ??
                                                    "",
                                                textColor: AppColors.whiteColor,
                                                styleType:
                                                    TextStyleType.SUBTITLE,
                                              ),
                                              Divider(
                                                color: AppColors.whiteColor,
                                                thickness: screenWidth(150),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: screenWidth(50)),
                                                    width: screenWidth(30),
                                                    height: screenWidth(30),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          AppColors.orangeColor,
                                                    ),
                                                  ),
                                                  controller.fans[0].members!
                                                              .length ==
                                                          0
                                                      ? SizedBox()
                                                      : CustomText(
                                                          text:
                                                              "أعضاء الرابطة ",
                                                          textColor: AppColors
                                                              .whiteColor,
                                                          styleType:
                                                              TextStyleType
                                                                  .SUBTITLE,
                                                        ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: screenWidth(50)),
                                                    width: screenWidth(30),
                                                    height: screenWidth(30),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          AppColors.orangeColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              controller.fans[0].members!
                                                          .length ==
                                                      0
                                                  ? SizedBox()
                                                  : GridView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        childAspectRatio: 4,
                                                        crossAxisCount: 2,
                                                      ),
                                                      itemCount: controller
                                                          .fans[0]
                                                          .members!
                                                          .length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Container(
                                                            child: Center(
                                                          child: CustomText(
                                                            text: controller
                                                                    .fans[0]
                                                                    .members![
                                                                        index]
                                                                    .name ??
                                                                "",
                                                            textColor: AppColors
                                                                .whiteColor,
                                                          ),
                                                        ));
                                                      },
                                                    ),
                                              SizedBox(
                                                height: screenWidth(30),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                    SizedBox(height: screenWidth(20)),
                    Obx(() => controller.fans.length == 0
                        ? SizedBox()
                        : controller.fans[0].description == null
                            ? SizedBox()
                            : CustomText(
                                text: "لمحة عن الرابطة",
                                styleType: TextStyleType.CUSTOMTITLE,
                              )),
                    SizedBox(height: screenWidth(20)),
                    Obx(() => controller.fans.length == 0
                        ? SizedBox()
                        : controller.fans[0].description == null
                            ? SizedBox()
                            : CustomText(
                                overflow: TextOverflow.visible,
                                text: controller.fans[0].description ?? "")),
                    SizedBox(height: screenWidth(20)),
                    Obx(() => controller.fans.length == 0
                        ? SizedBox()
                        : controller.fans[0].videos == null
                            ? SizedBox()
                            : CustomText(
                                text: "اجمل لقطات مشجعي نادي الكرامة",
                                styleType: TextStyleType.CUSTOMTITLE,
                              )),
                    SizedBox(height: screenWidth(20)),
                    Obx(() => controller.isLoading.value
                        ? CustomShimmer(
                            width: screenWidth(3),
                            height: screenWidth(3),
                            shimmerType: ShimmerType.GROUP,
                          )
                        : controller.fans.length == 0
                            ? SizedBox()
                            : controller.fans[0].videos == null
                                ? SizedBox()
                                : controller.fans[0].videos!.length == 0
                                    ? SizedBox()
                                    : Container(
                                        width: screenWidth(1),
                                        height: screenWidth(4),
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                                width: screenWidth(40));
                                          },
                                          itemCount:
                                              controller.fans[0].videos!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () async {
                                                await launchURL(controller
                                                        .fans[0]
                                                        .videos![index]
                                                        .url ??
                                                    "");
                                              },
                                              child: Container(
                                                width: screenWidth(3),
                                                height: screenWidth(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        child: CustomImage(
                                                          url: controller
                                                              .imagesUrl[index],
                                                          width: screenWidth(3),
                                                          height:
                                                              screenWidth(3),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Image.asset(
                                                        "assets/images/pngs/icon_youtube.png",
                                                        width: screenWidth(8),
                                                        height: screenWidth(8),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )),
                    SizedBox(
                      height: screenWidth(10),
                    )
                  ],
                ),
              ),
            )));
  }
}
