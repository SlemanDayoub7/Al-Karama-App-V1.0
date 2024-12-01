import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:al_karama_app/ui/views/landing_view/landing_controller.dart';
import 'package:al_karama_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

import 'package:get/get.dart';

import '../../../core/data/models/sports_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool? haveIconBack;
  Color? backGroundColor;
  HomeController controller = Get.find<HomeController>();
  CustomAppBar(
      {required this.title, this.haveIconBack = true, this.backGroundColor});
  @override
  Size get preferredSize => Size.fromHeight(screenWidth(5.7));
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      backgroundColor: AppColors.blueColorOne,
      automaticallyImplyLeading: false,
      leading: haveIconBack!
          ? IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                size: screenWidth(14),
                Icons.arrow_back_ios,
                color: AppColors.whiteColor,
              ))
          : SizedBox(),
      actions: [
        Obx(() => Container(
              margin: EdgeInsetsDirectional.only(end: screenWidth(30)),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.orangeColor,
                    width: screenWidth(screenWidth(1)),
                  ),
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(screenWidth(70)),
              width: screenWidth(6.3),
              height: screenWidth(8),
              child: Center(
                child: controller.sports.length == 0
                    ? SizedBox()
                    : PopupMenuButton(
                        position: PopupMenuPosition.under,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.zero,
                        color: AppColors.whiteColor,
                        onSelected: (value) {
                          print("ss");
                        },
                        child: Container(
                            width: screenWidth(11),
                            height: screenWidth(11),
                            child: CustomImage(
                              url: controller
                                      .sports[controller.selectedSport.value]
                                      .image ??
                                  "",
                              height: screenWidth(11),
                              width: screenWidth(11),
                              fit: BoxFit.fill,
                            )),
                        itemBuilder: (context) {
                          return [
                            ...List.generate(
                              controller.sports.length,
                              (index) => PopupMenuItem(
                                onTap: () {
                                  controller.selectSport(
                                      controller.sports[index].uuid ?? "");
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(bottom: screenWidth(60)),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(screenWidth(40)),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.blueColorOne,
                                      border: Border.all(
                                          width: screenWidth(screenWidth(1)),
                                          color: AppColors.orangeColor)),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: screenWidth(11),
                                          height: screenWidth(11),
                                          child: CustomImage(
                                            url: controller
                                                    .sports[index].image ??
                                                "",
                                            height: screenWidth(10),
                                            width: screenWidth(10),
                                            fit: BoxFit.fill,
                                          )),
                                      SizedBox(
                                        width: screenWidth(30),
                                      ),
                                      Expanded(
                                        child: CustomText(
                                          styleType: TextStyleType.SMALL,
                                          text: controller.sports[index].name ??
                                              "",
                                          textColor: AppColors.whiteColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ];
                        },
                      ),
              ),
            )),
      ],
      title: CustomText(
        text: title,
        styleType: TextStyleType.TITLE,
        textColor: AppColors.whiteColor,
      ),
      centerTitle: true,
    );
  }
}
