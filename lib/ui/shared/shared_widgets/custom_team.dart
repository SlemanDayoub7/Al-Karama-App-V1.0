import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:flutter/widgets.dart';

class CustomTeam extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Color textColor;
  const CustomTeam(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(5.4),
      height: screenWidth(4.5),
      child: Column(
        children: [
          CustomImage(
            url: imageUrl,
            fit: BoxFit.cover,
            width: screenWidth(8),
            height: screenWidth(8),
          ),
          CustomText(
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w800,
            text: name,
            textColor: textColor,
            max_lines: 2,
            styleType: TextStyleType.SMALL,
          )
        ],
      ),
    );
  }
}
