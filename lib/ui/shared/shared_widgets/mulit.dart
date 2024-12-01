import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

class MultiColorUnderline extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double underlineWidth;

  const MultiColorUnderline({
    Key? key,
    required this.text,
    this.underlineWidth = 3.0,
    this.fontWeight,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a TextPainter to measure the text width

    final textPainter = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontSize: screenWidth(22),
              fontWeight: fontWeight ?? FontWeight.w800,
              color: textColor)),
      textDirection: TextDirection.ltr,
    )..layout();
    List<Color> underlineColors = [
      AppColors.blueColorOne,
      AppColors.orangeColor,
      AppColors.blueColorOne
    ];
    // Calculate the width of each color segment
    final segmentWidth = textPainter.width / underlineColors.length;

    // Create a list of colored containers
    final containers = <Widget>[];
    containers.add(Container(
        margin: EdgeInsets.only(left: screenWidth(60)),
        width: segmentWidth + segmentWidth / 1.5,
        height: underlineWidth,
        color: AppColors.blueColorOne));
    containers.add(Container(
        margin: EdgeInsets.only(left: screenWidth(60)),
        width: segmentWidth,
        height: underlineWidth,
        color: AppColors.orangeColor));
    containers.add(Container(
        margin: EdgeInsets.only(left: screenWidth(60)),
        width: segmentWidth / 1.5,
        height: underlineWidth,
        color: AppColors.blueColorOne));
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text,
                style: TextStyle(
                    fontSize: screenWidth(22),
                    fontWeight: fontWeight ?? FontWeight.w800,
                    color: textColor)),
            SizedBox(
              height: screenWidth(50),
            ),
            // Put the row of containers below
            Row(
              children: containers,
            ),
          ],
        ),
      ],
    );
  }
}
