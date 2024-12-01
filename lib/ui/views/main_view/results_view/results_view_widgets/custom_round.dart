import 'package:flutter/material.dart';
import 'package:al_karama_app/core/data/models/match_model.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

class CustomRound extends StatelessWidget {
  final Football football;
  const CustomRound({
    super.key,
    required this.football,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidth(1.5),
      width: screenWidth(1),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/pngs/game_bg.png",
            width: screenWidth(1),
            height: screenWidth(1.5),
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth(15)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImage(
                    url: football.team1!.logo ?? "",
                    width: screenWidth(7),
                    height: screenWidth(7),
                    fit: BoxFit.fill,
                  ),
                  CustomText(
                    text: football.team1!.name ?? "",
                    styleType: TextStyleType.SUBTITLE,
                    textColor: AppColors.whiteColor,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth(15)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImage(
                    url: football.team2!.logo ?? "",
                    width: screenWidth(7),
                    height: screenWidth(7),
                    fit: BoxFit.fill,
                  ),
                  CustomText(
                    text: football.team2!.name ?? "",
                    styleType: TextStyleType.SUBTITLE,
                    textColor: AppColors.whiteColor,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: screenWidth(2.4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: screenWidth(100),
                  ),
                  CustomText(
                    max_lines: 1,
                    fontWeight: FontWeight.w400,
                    styleType: TextStyleType.SUBTITLE,
                    text: football.date ?? "",
                    textColor: AppColors.whiteColor,
                  ),
                  CustomText(
                    max_lines: 1,
                    fontWeight: FontWeight.w400,
                    styleType: TextStyleType.SUBTITLE,
                    text: football.time ?? "",
                    textColor: AppColors.whiteColor,
                  ),
                  SizedBox(
                    height: screenWidth(20),
                  ),
                  CustomText(
                    max_lines: 1,
                    text: (football.playGround ?? ""),
                    styleType: TextStyleType.SUBTITLE,
                  ),
                  CustomText(
                    max_lines: 1,
                    textColor: AppColors.greenColor,
                    text: (football.result!.team1 ?? "") +
                        " : " +
                        (football.result!.team2 ?? ""),
                    styleType: TextStyleType.CUSTOM,
                    fontSize: screenWidth(12),
                    fontWeight: FontWeight.w800,
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: "الجولة",
                    styleType: TextStyleType.SUBTITLE,
                    textColor: AppColors.whiteColor,
                  ),
                  CustomText(
                    text: football.round ?? "",
                    styleType: TextStyleType.SUBTITLE,
                    textColor: AppColors.whiteColor,
                  ),
                  SizedBox(
                    height: screenWidth(50),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
