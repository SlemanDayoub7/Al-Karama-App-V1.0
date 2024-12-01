import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/mulit.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

enum TextStyleType {
  TITLE,
  SUBTITLE,
  BODY,
  SMALL,
  CUSTOM,
  CUSTOMTITLE,
}

class CustomText extends StatelessWidget {
  final String text;
  final int? max_lines;
  final TextStyleType? styleType;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  const CustomText({
    super.key,
    required this.text,
    this.styleType = TextStyleType.BODY,
    this.textColor,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.max_lines,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return styleType == TextStyleType.CUSTOMTITLE
        ? MultiColorUnderline(
            text: text,
          )
        : Text(
            text,
            style: getStyle(size),
            textAlign: textAlign ?? TextAlign.justify,
            overflow: overflow ?? TextOverflow.ellipsis,
            maxLines: max_lines,
          );
  }

  TextStyle getStyle(Size size) {
    TextStyle result = TextStyle();

    switch (styleType) {
      case TextStyleType.TITLE:
        result = TextStyle(
            fontSize: screenWidth(22),
            fontWeight: fontWeight ?? FontWeight.w800,
            color: textColor);
        break;
      case TextStyleType.SUBTITLE:
        result = TextStyle(
            fontSize: screenWidth(24),
            fontWeight: fontWeight ?? FontWeight.w800,
            color: textColor);
        break;
      case TextStyleType.BODY:
        result = TextStyle(
            fontSize: screenWidth(30),
            fontWeight: fontWeight ?? FontWeight.w800,
            color: textColor);
        break;
      case TextStyleType.SMALL:
        result = TextStyle(
            fontSize: screenWidth(33),
            fontWeight: fontWeight ?? FontWeight.w800,
            color: textColor);
        break;
      case TextStyleType.CUSTOM:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
        break;
      case TextStyleType.CUSTOMTITLE:
        result = TextStyle(
            fontSize: screenWidth(20),
            fontWeight: fontWeight ?? FontWeight.w800,
            color: textColor);
        break;
      default:
        result = TextStyle(
            fontSize: screenWidth(28),
            fontWeight: FontWeight.normal,
            color: textColor);
        break;
    }

    return result;
  }
}
