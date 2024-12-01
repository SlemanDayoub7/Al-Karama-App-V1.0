import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/data/models/match_model.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:flutter/widgets.dart';

import '../../../../shared/custom_widgets/custom_image.dart';

class CustomMatch extends StatelessWidget {
  final bool isCurrentMatch;
  final Football match;

  const CustomMatch(
      {super.key, required this.isCurrentMatch, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth(20)),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.grayColorTwo, blurRadius: screenWidth(100))
          ],
          color: AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(30)),
      height: screenWidth(2.4),
      width: screenWidth(1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                url: match.team1!.logo!,
                width: screenWidth(5.5),
                height: screenWidth(5.5),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: screenWidth(50),
              ),
              FittedBox(
                child: CustomText(
                  textColor: AppColors.blackColor,
                  text: match.team1 == null ? "" : match.team1!.name ?? "",
                  styleType: TextStyleType.SUBTITLE,
                ),
              )
            ],
          ),
          isCurrentMatch
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: screenWidth(10), right: screenWidth(50)),
                  child: CustomText(
                    fontSize: screenWidth(10),
                    styleType: TextStyleType.CUSTOM,
                    text: match.result != null ? match.result!.team1 ?? "" : "",
                  ),
                )
              : SizedBox(),
          isCurrentMatch
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomText(
                      text: (match.playGround ?? ""),
                      styleType: isCurrentMatch
                          ? TextStyleType.SMALL
                          : TextStyleType.SUBTITLE,
                    ),
                    Spacer(),
                    CustomText(
                      text: (match.date ?? ""),
                      styleType: isCurrentMatch
                          ? TextStyleType.SMALL
                          : TextStyleType.SUBTITLE,
                    ),
                    CustomText(
                      text: (match.time ?? ""),
                      styleType: isCurrentMatch
                          ? TextStyleType.SMALL
                          : TextStyleType.SUBTITLE,
                    ),
                  ],
                )
              : Expanded(
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: (match.playGround ?? ""),
                          styleType: isCurrentMatch
                              ? TextStyleType.SMALL
                              : TextStyleType.SUBTITLE,
                        ),
                        SizedBox(height: screenWidth(20)),
                        CustomText(
                          text: (match.date ?? ""),
                          styleType: isCurrentMatch
                              ? TextStyleType.SMALL
                              : TextStyleType.SUBTITLE,
                        ),
                        SizedBox(height: screenWidth(20)),
                        CustomText(
                          text: (match.time ?? ""),
                          styleType: isCurrentMatch
                              ? TextStyleType.SMALL
                              : TextStyleType.SUBTITLE,
                        ),
                      ],
                    ),
                  ),
                ),
          isCurrentMatch
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: screenWidth(10), left: screenWidth(50)),
                  child: CustomText(
                    fontSize: screenWidth(10),
                    styleType: TextStyleType.CUSTOM,
                    text: match.result != null ? match.result!.team2 ?? "" : "",
                  ),
                )
              : SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                url: match.team2!.logo!,
                width: screenWidth(5.5),
                height: screenWidth(5.5),
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: screenWidth(50),
              ),
              FittedBox(
                child: CustomText(
                  text: (match.team2 == null ? "" : match.team2!.name ?? ""),
                  styleType: TextStyleType.SUBTITLE,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
