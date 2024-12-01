import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

class NavItem extends StatelessWidget {
  final String? iconName;
  final bool isSelected;
  final Function onTap;
  final String title;
  NavItem(
      {super.key,
      this.iconName,
      required this.isSelected,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(right: screenWidth(30)),
        padding: EdgeInsets.only(top: screenWidth(50)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconName != null
                ? Image.asset(
                    "assets/images/pngs/${iconName}",
                    width: screenWidth(15),
                    height: screenWidth(15),
                    color: isSelected
                        ? AppColors.orangeColor
                        : AppColors.whiteColor,
                  )
                : SizedBox(
                    height: screenWidth(15),
                  ),
            CustomText(
              fontSize: screenWidth(32),
              styleType: TextStyleType.CUSTOM,
              fontWeight: FontWeight.w800,
              text: title,
              textColor:
                  isSelected ? AppColors.orangeColor : AppColors.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
