import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';

import 'package:al_karama_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../../shared/custom_widgets/custom_image.dart';
import '../../../../shared/shared_widgets/custom_team.dart';
import '../../../../shared/utils.dart';

class NextMatchWidget extends StatelessWidget {
  const NextMatchWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: screenWidth(40), right: screenWidth(40)),
      width: screenWidth(1),
      height: screenWidth(1.5),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.grayColorTwo,
                blurRadius: 1,
                offset: Offset(2, 2))
          ],
          borderRadius: BorderRadius.circular(20),
          color: AppColors.blueColorOne),
      child: Row(
        children: [
          CustomImage(
            url: controller.nextMatch.value.player!.image!,
            width: screenWidth(3.2),
            height: screenWidth(1.2),
            fit: BoxFit.fill,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(screenWidth(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Center(
                      child: CustomText(
                          styleType: TextStyleType.SUBTITLE,
                          text: "المباراة القادمة",
                          textColor: AppColors.whiteColor),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTeam(
                          name: controller.nextMatch.value!.team1 != null
                              ? controller.nextMatch.value!.team1!.name ?? ""
                              : "",
                          imageUrl:
                              controller.nextMatch.value.team1!.logo ?? "",
                          textColor: AppColors.whiteColor),
                      CustomText(
                        text: "VS",
                        styleType: TextStyleType.SUBTITLE,
                        textColor: AppColors.whiteColor,
                      ),
                      CustomTeam(
                          name: controller.nextMatch.value!.team2 != null
                              ? controller.nextMatch.value!.team2!.name ?? ""
                              : "",
                          imageUrl:
                              controller.nextMatch.value.team2!.logo ?? "",
                          textColor: AppColors.whiteColor)
                    ],
                  ),
                  customRow(
                    imageUrl: "assets/images/pngs/date.png",
                    text: controller.nextMatch.value!.date ?? "",
                  ),
                  customRow(
                    imageUrl: "assets/images/pngs/time.png",
                    text: controller.nextMatch.value!.time ?? "",
                  ),
                  customRow(
                    imageUrl: "assets/images/pngs/location.png",
                    text: controller.nextMatch.value!.playGround ?? "",
                  ),
                  customRow(
                    imageUrl: "assets/images/pngs/live.png",
                    text: controller.nextMatch.value.channel ?? "",
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class customRow extends StatelessWidget {
  final String imageUrl;
  final String text;
  const customRow({
    super.key,
    required this.imageUrl,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: screenWidth(17),
          height: screenWidth(17),
        ),
        SizedBox(width: screenWidth(40)),
        CustomText(
          textColor: AppColors.whiteColor,
          text: text,
          styleType: TextStyleType.SMALL,
        ),
      ],
    );
  }
}
