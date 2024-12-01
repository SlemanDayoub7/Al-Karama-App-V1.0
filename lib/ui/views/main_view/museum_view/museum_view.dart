import 'package:al_karama_app/ui/shared/shared_widgets/custom_refresh.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/enums/shimmer_type.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_shimmer.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_video.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/museum_view/museum_controller.dart';
import 'package:al_karama_app/ui/views/main_view/museum_view/museum_view_widgets/custom_about_club.dart';
import 'package:al_karama_app/ui/views/main_view/museum_view/museum_view_widgets/custom_boss.dart';
import 'package:al_karama_app/ui/views/main_view/museum_view/museum_view_widgets/custom_cup.dart';
import 'package:get/get.dart';

class MusemumView extends StatelessWidget {
  MusemumView({super.key});
  MuseumController controller = Get.put(MuseumController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.backGroundColor,
            appBar: CustomAppBar(
              title: "المتحف",
              haveIconBack: false,
            ),
            body: RefreshableList(
              onRefresh: controller.getData,
              widget: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: screenWidth(50),
                  ),
                  Obx(
                    () => controller.musemum.aboutClub == null ||
                            controller.musemum.aboutClub!.length == 0
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(
                                bottom: screenWidth(20), top: screenWidth(20)),
                            child: CustomText(
                              text: "عن النادي",
                              styleType: TextStyleType.CUSTOMTITLE,
                            ),
                          ),
                  ),
                  Obx(() => controller.isLoading.value
                      ? CustomShimmer(
                          margin: screenWidth(30),
                          shimmerType: ShimmerType.GROUP,
                          height: screenWidth(2.2),
                          width: screenWidth(1.7),
                        )
                      : controller.musemum.aboutClub == null ||
                              controller.musemum.aboutClub!.length == 0
                          ? SizedBox()
                          : Container(
                              width: screenWidth(1),
                              height: screenWidth(2),
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: screenWidth(20));
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.musemum.aboutClub!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomAboutClub(
                                      text: controller.musemum.aboutClub![index]
                                              .title ??
                                          "",
                                      imageUrl: controller.musemum
                                              .aboutClub![index].image ??
                                          "");
                                },
                              ))),
                  Obx(() => controller.musemum.bosses == null ||
                          controller.musemum.bosses!.length == 0
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(
                              bottom: screenWidth(20), top: screenWidth(20)),
                          child: CustomText(
                            text: "رؤساء النادي",
                            styleType: TextStyleType.CUSTOMTITLE,
                          ),
                        )),
                  Obx(() => controller.isLoading.value
                      ? CustomShimmer(
                          margin: screenWidth(30),
                          shimmerType: ShimmerType.GROUP,
                        )
                      : controller.musemum.bosses == null ||
                              controller.musemum.bosses!.length == 0
                          ? SizedBox()
                          : Container(
                              width: screenWidth(1),
                              height: screenWidth(1.8),
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CustomBoss(
                                      imageUrl: controller
                                              .musemum.bosses![index].image ??
                                          "",
                                      name: controller
                                              .musemum.bosses![index].name ??
                                          "",
                                      date: controller.musemum.bosses![index]
                                              .startYear ??
                                          "",
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: screenWidth(30),
                                    );
                                  },
                                  itemCount: controller.musemum.bosses!.length),
                            )),
                  Obx(() => controller.primesClub.length == 0
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(
                              bottom: screenWidth(20), top: screenWidth(20)),
                          child: CustomText(
                            text: "ألقاب نادي الكرامة",
                            styleType: TextStyleType.CUSTOMTITLE,
                          ),
                        )),
                  Obx(() => controller.isLoading.value
                      ? CustomShimmer(
                          margin: screenWidth(30),
                          shimmerType: ShimmerType.GROUP,
                        )
                      : controller.primesClub.length == 0
                          ? SizedBox()
                          : Container(
                              width: screenWidth(1),
                              height: screenWidth(1.8),
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CustomCup(
                                      cupName:
                                          controller.primesClub[index].name ??
                                              "",
                                      date: controller
                                              .primesClub[index].seasone ??
                                          "",
                                      imageUrl:
                                          controller.primesClub[index].image ??
                                              "",
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: screenWidth(30),
                                    );
                                  },
                                  itemCount: controller.primesClub.length),
                            )),
                  Obx(() => controller.musemum.primes == null ||
                          controller.musemum.primes!.length == 0
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(
                              bottom: screenWidth(20), top: screenWidth(20)),
                          child: CustomText(
                            text: "الجوائز الفردية للاعبي  الكرامة",
                            styleType: TextStyleType.CUSTOMTITLE,
                          ),
                        )),
                  Obx(() => controller.isLoading.value
                      ? CustomShimmer(
                          margin: screenWidth(30),
                          shimmerType: ShimmerType.GROUP,
                        )
                      : controller.primesPlayers.length == 0
                          ? SizedBox()
                          : Container(
                              width: screenWidth(1),
                              height: screenWidth(1.8),
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CustomBoss(
                                      imageUrl: controller
                                              .primesPlayers[index].image ??
                                          "",
                                      name: controller
                                              .primesPlayers[index].name ??
                                          " ",
                                      date: controller.primesPlayers[index]
                                              .description ??
                                          " ",
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: screenWidth(30),
                                    );
                                  },
                                  itemCount: controller.primesPlayers.length),
                            )),
                  Obx(() => controller.musemum.bestGoals == null ||
                          controller.musemum.bestGoals!.length == 0
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(
                              bottom: screenWidth(20), top: screenWidth(20)),
                          child: CustomText(
                            text: "أجمل أهداف لاعبي الكرامة",
                            styleType: TextStyleType.CUSTOMTITLE,
                          ),
                        )),
                  Obx(() => controller.isLoading.value
                      ? CustomShimmer(
                          margin: screenWidth(30),
                          shimmerType: ShimmerType.GROUP,
                          width: screenWidth(1.2),
                          height: screenWidth(3),
                        )
                      : controller.musemum.bestGoals == null ||
                              controller.musemum.bestGoals!.length == 0
                          ? SizedBox()
                          : Container(
                              width: screenWidth(1),
                              height: screenWidth(3.5),
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CustomVideo(
                                      color: AppColors.blueColorOne,
                                      title: controller.musemum
                                              .bestGoals![index].description ??
                                          "",
                                      videoUrl: controller
                                              .musemum.bestGoals![index].url ??
                                          "",
                                      imageUrl: controller.imagesUrl[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: screenWidth(30),
                                    );
                                  },
                                  itemCount:
                                      controller.musemum.bestGoals!.length),
                            )),
                  SizedBox(
                    height: screenWidth(2),
                  ),
                ],
              ),
            )));
  }
}
