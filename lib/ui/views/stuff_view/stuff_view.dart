import 'package:al_karama_app/ui/shared/shared_widgets/custom_refresh.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/data/models/stuff_model.dart';
import 'package:al_karama_app/core/enums/cart_type.dart';
import 'package:al_karama_app/core/enums/shimmer_type.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_player_cart.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_shimmer.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/stuff_view/stuff_controller.dart';
import 'package:get/get.dart';
import '../../shared/custom_widgets/custom_image.dart';

class StuffView extends StatelessWidget {
  StuffView({super.key});
  StuffController controller = Get.put(StuffController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CustomAppBar(
        title: "كادر الادارة و اللاعبين",
        haveIconBack: true,
      ),
      body: RefreshableList(
        onRefresh: controller.getData,
        widget: ListView(
          shrinkWrap: true,
          children: [
            Obx(() => !controller.isLoading.value &&
                    controller.isStuffEmpty(controller.stuff.value)
                ? Container(
                    height: screenHeight(3),
                    child:
                        Center(child: CustomText(text: "لا يوجد بيانات بعد")))
                : SizedBox()),
            SizedBox(
              height: screenWidth(20),
            ),
            Obx(() => controller.isLoading.value
                ? CustomShimmer(
                    shimmerType: ShimmerType.CUSTOM,
                    widget: Container(
                      decoration: BoxDecoration(
                          color: AppColors.backGroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      width: screenWidth(1),
                      height: screenWidth(3),
                    ),
                  )
                : controller.stuff.value.boss != null
                    ? controller.stuff.value.boss!.name != null &&
                            controller.stuff.value.boss!.image != null
                        ? Container(
                            width: screenWidth(1),
                            height: screenWidth(2),
                            child: Stack(
                              fit: StackFit.loose,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: screenWidth(1),
                                    height: screenWidth(3),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                "assets/images/pngs/boss_background.png"))),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: CustomImage(
                                      url: controller.stuff.value.boss!.image!,
                                      fit: BoxFit.fill,
                                      width: screenWidth(3),
                                      height: screenWidth(1),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: screenWidth(2.8),
                                      top: screenWidth(7),
                                      left: screenWidth(30)),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FittedBox(
                                          child: CustomText(
                                            text: "رئيس نادي الكرامة :",
                                            styleType: TextStyleType.TITLE,
                                            textColor: AppColors.whiteColor,
                                          ),
                                        ),
                                        FittedBox(
                                          child: CustomText(
                                            text: controller
                                                    .stuff.value.boss!.name ??
                                                "",
                                            styleType: TextStyleType.TITLE,
                                            textColor: AppColors.whiteColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox()
                    : SizedBox()),
            SizedBox(
              height: screenWidth(20),
            ),
            Obx(() => controller.isLoading.value
                ? CustomShimmer(
                    shimmerType: ShimmerType.CUSTOM,
                    widget: Container(
                      margin: EdgeInsets.only(left: screenWidth(8)),
                      height: screenWidth(11),
                      width: screenWidth(5),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
                : controller.stuff.value.wears != null
                    ? CustomText(
                        text: "ملابس فريق نادي الكرامة لعام " +
                            controller.currentSeason.value,
                        styleType: TextStyleType.CUSTOMTITLE,
                      )
                    : SizedBox()),
            SizedBox(
              height: screenWidth(20),
            ),
            Obx(() => controller.isLoading.value
                ? CustomShimmer(
                    shimmerType: ShimmerType.CUSTOM,
                    widget: Container(
                      decoration: BoxDecoration(
                          color: AppColors.backGroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      width: screenWidth(1),
                      height: screenWidth(2),
                    ),
                  )
                : controller.stuff.value.wears == null
                    ? SizedBox()
                    : Container(
                        height: screenWidth(2),
                        width: screenWidth(1),
                        decoration: BoxDecoration(
                            color: AppColors.blueColorOne,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: CustomImage(
                          url: controller.stuff.value.wears!.image!,
                          width: screenWidth(1.4),
                          height: screenWidth(1.4),
                          fit: BoxFit.cover,
                        )),
                      )),
            SizedBox(
              height: screenWidth(20),
            ),
            Obx(() => controller.isLoading.value
                ? CustomShimmer(
                    shimmerType: ShimmerType.GROUP,
                  )
                : controller.stuff.value.managers == null
                    ? SizedBox()
                    : CustomGroup(
                        managers: controller.stuff.value.managers,
                        title: "الاداريين",
                        cartType: CartType.MANAGER,
                      )),
            SizedBox(
              height: screenWidth(20),
            ),
            Obx(() => controller.isLoading.value
                ? CustomShimmer(
                    shimmerType: ShimmerType.GROUP,
                  )
                : controller.stuff.value.attack == null
                    ? SizedBox()
                    : CustomGroup(
                        players: controller.stuff.value.attack,
                        title: "المهاجمون",
                        cartType: CartType.PLAYER,
                      )),
            SizedBox(
              height: screenWidth(20),
            ),
            Obx(() => controller.isLoading.value
                ? CustomShimmer(
                    shimmerType: ShimmerType.GROUP,
                  )
                : controller.stuff.value.defence == null
                    ? SizedBox()
                    : CustomGroup(
                        players: controller.stuff.value.defence,
                        title: "المدافعون",
                        cartType: CartType.PLAYER,
                      )),
            SizedBox(
              height: screenWidth(20),
            ),
            Obx(() => controller.isLoading.value
                ? CustomShimmer(
                    shimmerType: ShimmerType.GROUP,
                  )
                : controller.stuff.value.middle == null
                    ? SizedBox()
                    : CustomGroup(
                        players: controller.stuff.value.middle,
                        title: "الوسط",
                        cartType: CartType.PLAYER,
                      )),
            SizedBox(
              height: screenWidth(20),
            ),
            Obx(() => controller.isLoading.value
                ? CustomShimmer(
                    shimmerType: ShimmerType.GROUP,
                  )
                : controller.stuff.value.goalKeepers == null
                    ? SizedBox()
                    : CustomGroup(
                        players: controller.stuff.value.goalKeepers,
                        title: "حراس المرمى",
                        cartType: CartType.GOALKEAPR,
                      )),
            SizedBox(
              height: screenWidth(10),
            ),
          ],
        ),
      ),
    ));
  }
}

class CustomGroup extends StatelessWidget {
  final CartType cartType;
  final String title;
  final List<Managers>? managers;
  final List<Attack>? players;

  const CustomGroup({
    super.key,
    required this.title,
    required this.cartType,
    this.managers,
    this.players,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          styleType: TextStyleType.CUSTOMTITLE,
        ),
        SizedBox(
          height: screenWidth(20),
        ),
        Container(
          width: screenWidth(1),
          height: screenWidth(1.5),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                width: screenWidth(20),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: players != null ? players!.length : managers!.length,
            itemBuilder: (BuildContext context, int index) {
              return players != null
                  ? CustomPlayerCart(
                      cartType: cartType, player: players![index])
                  : CustomPlayerCart(
                      cartType: cartType,
                      manager: managers![index],
                    );
            },
          ),
        ),
      ],
    );
  }
}
