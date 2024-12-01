import 'package:al_karama_app/ui/shared/shared_widgets/custom_refresh.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/enums/shimmer_type.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_app_bar.dart';

import 'package:al_karama_app/ui/shared/shared_widgets/custom_shimmer.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/results_view/results_controller.dart';
import 'package:al_karama_app/ui/views/main_view/results_view/results_view_widgets/custom_round.dart';
import 'package:al_karama_app/ui/views/main_view/results_view/results_view_widgets/ranking_table.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class ResultsView extends StatelessWidget {
  ResultsView({super.key});
  ResultsController controller = Get.put(ResultsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CustomAppBar(
        title: "النتائج",
        haveIconBack: false,
      ),
      body: RefreshableList(
        onRefresh: controller.getData,
        widget: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: screenWidth(20)),
            Obx(() => controller.isLoading.value
                ? CustomShimmer(
                    shimmerType: ShimmerType.CUSTOM,
                    widget: Container(
                      decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(25)),
                      height: screenWidth(1.5),
                      width: screenWidth(1),
                    ),
                  )
                : controller.matches.value.football == null
                    ? SizedBox()
                    : controller.matches.value.football!.length == 0
                        ? SizedBox()
                        : Container(
                            height: screenWidth(1.5),
                            width: screenWidth(1),
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  carouselController:
                                      controller.carouselController,
                                  options: CarouselOptions(
                                      onPageChanged: (index, reason) {},
                                      scrollPhysics: BouncingScrollPhysics(),
                                      autoPlay: true,
                                      aspectRatio: 2,
                                      height: screenWidth(1.5),
                                      viewportFraction: 1),
                                  items: [
                                    ...List.generate(
                                        controller.matches.value.football!
                                            .length, (index) {
                                      return CustomRound(
                                        football: controller
                                            .matches.value.football![index],
                                      );
                                    })
                                  ],
                                ),
                              ],
                            ),
                          )),
            SizedBox(height: screenWidth(20)),
            Obx(
              () => controller.isLoading.value
                  ? CustomShimmer(
                      shimmerType: ShimmerType.CUSTOM,
                      widget: Image.asset(
                        "assets/images/pngs/shimmer_table.png",
                        width: screenWidth(1),
                        height: screenWidth(1),
                        fit: BoxFit.fill,
                      ),
                    )
                  : controller.standing.value.football == null
                      ? SizedBox()
                      : controller.standing.value.football!.length == 0
                          ? SizedBox()
                          : RankingTabel(
                              visibileItem: 2,
                            ),
            ),
            SizedBox(
              height: screenWidth(2),
            )
          ],
        ),
      ),
    ));
  }
}
