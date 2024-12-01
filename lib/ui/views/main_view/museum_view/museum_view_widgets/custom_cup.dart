import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

class CustomCup extends StatelessWidget {
  final String cupName, date, imageUrl;
  const CustomCup(
      {super.key,
      required this.cupName,
      required this.date,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth(3.6),
          height: screenWidth(3),
          decoration: BoxDecoration(
              color: AppColors.grayColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              border: Border.all(
                  color: AppColors.goldColor, width: screenWidth(200))),
          child: Center(
            child: CustomImage(
              url: imageUrl,
              width: screenWidth(5),
              height: screenWidth(4.4),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.all(screenWidth(60)),
            width: screenWidth(3),
            height: screenWidth(5.5),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "assets/images/pngs/cup_box.png",
              ),
              fit: BoxFit.fill,
            )),
            child: Stack(
              children: [
                Center(
                  child: FittedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: cupName,
                          fontWeight: FontWeight.w800,
                        ),
                        CustomText(
                          text: date,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
