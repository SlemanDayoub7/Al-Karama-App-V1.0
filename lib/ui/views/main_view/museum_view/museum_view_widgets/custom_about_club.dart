import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

class CustomAboutClub extends StatelessWidget {
  final String text, imageUrl;
  const CustomAboutClub(
      {super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1.3),
      height: screenWidth(1.8),
      decoration: BoxDecoration(
          color: AppColors.blueColorOne,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: CustomImage(
                  url: imageUrl,
                  width: screenWidth(1.3),
                  height: screenWidth(3),
                  fit: BoxFit.fill)),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: screenWidth(30)),
              width: screenWidth(1.1),
              decoration: BoxDecoration(
                  color: AppColors.blueColorOne,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomText(
                  text: text,
                  styleType: TextStyleType.SUBTITLE,
                  textColor: AppColors.whiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
