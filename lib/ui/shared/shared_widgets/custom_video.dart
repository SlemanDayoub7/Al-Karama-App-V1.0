import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

import '../custom_widgets/custom_image.dart';

class CustomVideo extends StatelessWidget {
  final String title, videoUrl;
  final Color? color;
  final String? imageUrl;
  const CustomVideo(
      {super.key,
      required this.title,
      this.color,
      required this.videoUrl,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launchURL(videoUrl);
      },
      child: Container(
        padding: EdgeInsets.all(screenWidth(40)),
        width: screenWidth(1.1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color ?? AppColors.whiteColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth(3.5),
              height: screenWidth(4),
              decoration: BoxDecoration(
                color: AppColors.grayColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth(20)),
                    child: CustomImage(
                      url: imageUrl ?? "",
                      fit: BoxFit.cover,
                      height: screenWidth(4),
                      width: screenWidth(3.5),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/pngs/icon_youtube.png",
                      width: screenWidth(9),
                      height: screenWidth(9),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth(40),
            ),
            Container(
              width: screenWidth(1.9),
              child: CustomText(
                max_lines: 2,
                textColor:
                    color == null ? AppColors.blackColor : AppColors.whiteColor,
                text: title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
