import 'package:al_karama_app/ui/shared/shared_widgets/custom_news.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_refresh.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_shimmer.dart';
import 'package:al_karama_app/ui/views/player_detail_view.dart/player_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:al_karama_app/ui/views/stuff_view/stuff_view.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../core/enums/shimmer_type.dart';
import '../../../shared/custom_widgets/custom_image.dart';
import 'home_view_widgets/next_match_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: screenWidth(4)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueColorOne,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: CustomText(
              text: "الكادر",
              textColor: AppColors.whiteColor,
            ),
            onPressed: () {
              Get.to(() => StuffView());
            },
          ),
        ),
        backgroundColor: AppColors.backGroundColor,
        appBar: CustomAppBar(
          title: "نادي الكرامة الرياضي",
          haveIconBack: false,
        ),
        body: RefreshableList(
          onRefresh: controller.getData,
          widget: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => PlayerDetailView(id: "1"));
                  },
                  child: CustomText(text: "text")),
              Obx(() => controller.isLoading.value
                  ? CustomShimmer(
                      shimmerType: ShimmerType.CUSTOM,
                      widget: SizedBox(),
                    )
                  : controller.banners.length == 0
                      ? SizedBox()
                      : Container(
                          margin: EdgeInsets.only(top: screenWidth(20)),
                          height: screenWidth(2.3),
                          width: screenWidth(1),
                          child: controller.banners.length == 1
                              ? Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.blueColorOne,
                                          width: screenWidth(200))),
                                  child: CustomImage(
                                      url: controller.banners[0].image ?? "",
                                      width: screenWidth(1),
                                      height: screenWidth(2),
                                      fit: BoxFit.fill),
                                )
                              : ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: screenWidth(80),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.banners.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.grayColorTwo,
                                              width: 1)),
                                      child: CustomImage(
                                          url:
                                              controller.banners[index].image ??
                                                  "",
                                          width: screenWidth(2.2),
                                          height: screenWidth(2),
                                          fit: BoxFit.fill),
                                    );
                                  },
                                ))),
              Obx(
                () => controller.isLoading.value
                    ? CustomShimmer(
                        shimmerType: ShimmerType.CUSTOM,
                        widget: Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20)),
                          width: screenWidth(1),
                          height: screenWidth(1.7),
                        ),
                      )
                    : controller.nextMatch.value.channel == null
                        ? SizedBox()
                        : NextMatchWidget(controller: controller),
              ),
              SizedBox(
                height: screenWidth(20),
              ),
              Obx(() => controller.isLoading.value
                  ? CustomShimmer(
                      shimmerType: ShimmerType.CUSTOM,
                      widget: Container(
                        margin: EdgeInsets.only(left: screenWidth(2)),
                        height: screenWidth(11),
                        width: screenWidth(5),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )
                  : controller.news.length == 0
                      ? SizedBox()
                      : CustomText(
                          text: "آخر الأخبار",
                          styleType: TextStyleType.CUSTOMTITLE,
                        )),
              SizedBox(
                height: screenWidth(20),
              ),
              Obx(() => !controller.isLoading.value
                  ? AnimationLimiter(
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: screenWidth(40),
                          );
                        },
                        itemCount: controller.news.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(
                            () => AnimationConfiguration.staggeredList(
                              position: index,
                              child: SlideAnimation(
                                duration: Duration(milliseconds: 600),
                                horizontalOffset: screenWidth(2),
                                child: FadeInAnimation(
                                  child: CustomNews(
                                      onTap: () {
                                        controller.openCustomeNews(index);
                                      },
                                      newsModel: controller.news[index],
                                      imageUrl: controller.news[index].image,
                                      description:
                                          controller.news[index].content ?? "",
                                      date: controller.news[index].date ?? "",
                                      viewers:
                                          controller.news[index].content ?? ""),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : CustomShimmer(shimmerType: ShimmerType.LIST)),
              SizedBox(
                height: screenWidth(2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
