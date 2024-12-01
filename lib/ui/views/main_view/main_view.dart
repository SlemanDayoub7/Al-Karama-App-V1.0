import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/about_club_view/about_club_view.dart';
import 'package:al_karama_app/ui/views/main_view/home_view/home_view.dart';

import 'package:al_karama_app/ui/views/main_view/main_view_widgets/bottom_navigation_bar.dart';
import 'package:al_karama_app/ui/views/main_view/matches_view/matches_view.dart';
import 'package:al_karama_app/ui/views/main_view/museum_view/museum_view.dart';

import 'package:al_karama_app/ui/views/main_view/results_view/results_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/enums/bottom_navigation.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 2);
  BottomNavigationEnum selecte = BottomNavigationEnum.HOME;

  GlobalKey<ScaffoldState> scafolldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                MatchesView(),
                ResultsView(),
                HomeView(),
                AboutClubView(),
                MusemumView()
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottmNavigation(
                onTap: (View, ix) {
                  selecte = View;
                  setState(() {});
                  controller.jumpToPage(ix);
                  //! here notify onTap in navitem
                },
                selectedView: selecte,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  selecte = BottomNavigationEnum.HOME;
                  setState(() {});
                  controller.jumpToPage(2);
                },
                child: Container(
                    padding: EdgeInsets.all(screenWidth(35)),
                    margin: EdgeInsets.only(bottom: screenWidth(15)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blueColorOne,
                    ),
                    width: screenWidth(5),
                    height: screenWidth(5),
                    child: Center(
                        child: SvgPicture.asset(
                      selecte != BottomNavigationEnum.HOME
                          ? "assets/images/svgs/logo_gray.svg"
                          : "assets/images/svgs/logo.svg",
                      fit: BoxFit.fill,
                      width: screenWidth(7),
                      height: screenWidth(7),
                    ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
