import 'package:al_karama_app/core/enums/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/translation/app_translation.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/main_view_widgets/nav_item.dart';

class CustomBottmNavigation extends StatefulWidget {
  final BottomNavigationEnum selectedView;
  final Function(BottomNavigationEnum, int) onTap;

  const CustomBottmNavigation(
      {super.key, required this.selectedView, required this.onTap});
  @override
  State<CustomBottmNavigation> createState() => _CustomBottmNavigationState();
}

class _CustomBottmNavigationState extends State<CustomBottmNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: screenWidth(100)),
      height: screenWidth(5.8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.grayColorTwo,
              blurRadius: 1,
              offset: Offset(0, -2))
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: AppColors.blueColorOne,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.MATCHES, 0);
              },
              isSelected: widget.selectedView == BottomNavigationEnum.MATCHES,
              title: "المباريات",
              iconName: 'location.png',
            ),
            NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.RESULTS, 1);
              },
              isSelected: widget.selectedView == BottomNavigationEnum.RESULTS,
              title: "النتائج",
              iconName: 'results.png',
            ),
            NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.HOME, 2);
              },
              isSelected: widget.selectedView == BottomNavigationEnum.HOME,
              title: "الرئيسية",
            ),
            NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.ABOUT, 3);
              },
              isSelected: widget.selectedView == BottomNavigationEnum.ABOUT,
              title: "عن النادي",
              iconName: 'about_club.png',
            ),
            NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.MUSEAUM, 4);
              },
              isSelected: widget.selectedView == BottomNavigationEnum.MUSEAUM,
              title: "المتحف",
              iconName: 'museum.png',
            ),
          ],
        ),
      ),
    );
  }
}
