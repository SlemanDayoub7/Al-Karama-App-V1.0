import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

class CustomBoss extends StatelessWidget {
  final String name, imageUrl, date;
  const CustomBoss(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: AppColors.blueColorOne),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: CustomImage(
              url: imageUrl,
              width: screenWidth(3),
              height: screenWidth(3),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(screenWidth(50)),
            width: screenWidth(3),
            height: screenWidth(5),
            decoration: BoxDecoration(
                color: AppColors.blueColorOne,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                    fit: BoxFit.fill,
                    child: CustomText(
                      textAlign: TextAlign.center,
                      max_lines: 1,
                      text: name,
                      textColor: AppColors.whiteColor,
                    )),
                FittedBox(
                    fit: BoxFit.fill,
                    child: CustomText(
                      textAlign: TextAlign.center,
                      max_lines: 1,
                      text: date,
                      textColor: AppColors.whiteColor,
                    )),
              ],
            )),
          )
        ],
      ),
    );
  }
}
