import 'package:al_karama_app/ui/shared/shared_widgets/custom_refresh.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/enums/shimmer_type.dart';

import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_shimmer.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/matches_view/matches_controller.dart';
import 'package:al_karama_app/ui/views/match_detail_view/match_detail_view.dart';
import 'package:al_karama_app/ui/views/main_view/matches_view/matches_view_widgets/custom_match.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MatchesView extends StatelessWidget {
  MatchesView({super.key});
  MatchesController controller = Get.put(MatchesController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: CustomAppBar(
          title: "المباريات",
          haveIconBack: false,
        ),
        body: RefreshableList(
          havePadding: false,
          onRefresh: controller.getData,
          widget: ListView(
            children: [
              Obx(() => (controller.finishedMatches.football == null ||
                          controller.finishedMatches.football?.length == 0) &&
                      (controller.matches.football == null ||
                          controller.matches.football?.length == 0) &&
                      !controller.isLoading
                  ? Container(
                      height: screenWidth(3),
                      child: Center(
                        child: CustomText(text: "لا يوجد بيانات"),
                      ),
                    )
                  : SizedBox()),
              SizedBox(
                height: screenWidth(30),
              ),
              Obx(() => controller.isLoading
                  ? CustomShimmer(
                      shimmerType: ShimmerType.CUSTOM,
                      widget: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.only(
                            left: screenWidth(30), right: screenWidth(30)),
                        height: screenWidth(3),
                        width: screenWidth(1),
                      ),
                    )
                  : controller.finishedMatches.football == null
                      ? SizedBox()
                      : controller.matches.football!.length == 0
                          ? SizedBox()
                          : Container(
                              width: screenWidth(1),
                              height: screenWidth(2),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth(30),
                                          right: screenWidth(30)),
                                      child: CustomMatch(
                                        isCurrentMatch: true,
                                        match: controller.finishedMatches
                                            .football![controller
                                                .finishedMatches
                                                .football!
                                                .length -
                                            1],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InkWell(
                                      onTap: () {
                                        controller.goToMatchDetail(controller
                                            .finishedMatches
                                            .football![controller
                                                .finishedMatches
                                                .football!
                                                .length -
                                            1]);
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.all(screenWidth(70)),
                                        decoration: BoxDecoration(
                                            color: AppColors.blueColorOne,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: screenWidth(3),
                                        height: screenWidth(11),
                                        child: Center(
                                          child: CustomText(
                                            styleType: TextStyleType.SMALL,
                                            text: "تفاصيل المبارة",
                                            textColor: AppColors.orangeColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
              SizedBox(
                height: screenWidth(15),
              ),
              Obx(() => controller.isLoading
                  ? CustomShimmer(
                      shimmerType: ShimmerType.CUSTOM,
                      widget: Container(
                        margin: EdgeInsets.only(
                            left: screenWidth(30), right: screenWidth(30)),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(30)),
                        width: screenWidth(1),
                        height: screenWidth(20),
                      ),
                    )
                  : controller.matches.football == null
                      ? SizedBox()
                      : controller.matches.football!.length == 0
                          ? SizedBox()
                          : Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth(50),
                                      right: screenWidth(50)),
                                  child: CustomText(
                                    text: "المباريات القادمة",
                                    styleType: TextStyleType.SUBTITLE,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
              SizedBox(
                height: screenWidth(15),
              ),
              Obx(() => Padding(
                  padding: EdgeInsets.all(screenWidth(30)),
                  child: controller.isLoading
                      ? CustomShimmer(shimmerType: ShimmerType.LIST)
                      : controller.matches.football == null
                          ? SizedBox()
                          : controller.matches.football!.length == 0
                              ? SizedBox()
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.matches.football!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomMatch(
                                      isCurrentMatch: false,
                                      match:
                                          controller.matches.football![index],
                                    );
                                  },
                                ))),
              SizedBox(
                height: screenWidth(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
