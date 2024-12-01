import 'package:al_karama_app/ui/shared/shared_widgets/custom_refresh.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/enums/shimmer_type.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_shimmer.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/results_view/results_controller.dart';
import 'package:al_karama_app/ui/views/main_view/results_view/results_view_widgets/ranking_table.dart';
import 'package:get/get.dart';

class FullTabel extends StatelessWidget {
  FullTabel({super.key});
  ResultsController controller = Get.find<ResultsController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: CustomAppBar(title: "جدول الترتيب"),
        body: RefreshableList(
          onRefresh: controller.getData,
          widget: ListView(
            children: [
              SizedBox(height: screenWidth(10)),
              Obx(
                () => controller.isLoading.value
                    ? CustomShimmer(
                        shimmerType: ShimmerType.CUSTOM,
                        widget: Container(
                          width: screenWidth(1),
                          height: screenWidth(8.5),
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: screenWidth(50),
                                );
                              },
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  width: screenWidth(3.5),
                                  height: screenWidth(8.5),
                                );
                              }),
                        ),
                      )
                    : controller.seasons.length == 0
                        ? SizedBox()
                        : Container(
                            width: screenWidth(1),
                            height: screenWidth(8.5),
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: screenWidth(50),
                                  );
                                },
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.seasons.length,
                                itemBuilder: (context, index) {
                                  return Obx(() => InkWell(
                                        onTap: () async {
                                          controller.selectedDate.value = index;
                                          controller.selectedSeasonsId.value =
                                              controller.seasons[index].uuid!;
                                          await controller.getData();
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: screenWidth(200),
                                                    color:
                                                        AppColors.grayColorTwo),
                                                color: controller
                                                            .selectedSeasonsId
                                                            .value ==
                                                        controller.seasons
                                                            .value[index].uuid
                                                    ? AppColors.blueColorOne
                                                    : null,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            width: screenWidth(3.5),
                                            height: screenWidth(8.5),
                                            child: Center(
                                              child: CustomText(
                                                textColor: controller
                                                            .selectedSeasonsId
                                                            .value ==
                                                        controller.seasons
                                                            .value[index].uuid
                                                    ? AppColors.whiteColor
                                                    : AppColors.grayColorTwo,
                                                text: controller
                                                        .seasons[index].name ??
                                                    "",
                                                styleType:
                                                    TextStyleType.SUBTITLE,
                                              ),
                                            )),
                                      ));
                                }),
                          ),
              ),
              SizedBox(
                height: screenWidth(20),
              ),
              Obx(() => controller.isLoading.value
                  ? CustomShimmer(
                      shimmerType: ShimmerType.CUSTOM,
                      widget: Image.asset(
                        "assets/images/pngs/shimmer_table.png",
                        width: screenWidth(1),
                        height: screenWidth(1),
                        fit: BoxFit.fill,
                      ),
                    )
                  : RankingTabel(
                      visibileItem: 1,
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
