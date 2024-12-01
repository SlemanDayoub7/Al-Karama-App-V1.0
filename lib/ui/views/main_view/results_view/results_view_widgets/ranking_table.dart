import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';

import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/main_view/results_view/results_controller.dart';
import 'package:al_karama_app/ui/views/main_view/results_view/results_view_widgets/full_tabel.dart';
import 'package:get/get.dart';

class RankingTabel extends StatelessWidget {
  final int visibileItem;
  RankingTabel({super.key, this.visibileItem = 1});
  ResultsController controller = Get.find<ResultsController>();
  @override
  Widget build(BuildContext contitle) {
    return Obx(() => controller.standing.value.football == null
        ? SizedBox()
        : Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: visibileItem == 2 ? screenWidth(1) : null,
            width: screenWidth(1),
            child: Stack(
              children: [
                Container(
                  height: visibileItem == 2
                      ? screenWidth(1)
                      : screenWidth(9.3) *
                          (controller.standing.value.football!.length + 1),
                  decoration: BoxDecoration(
                      color: AppColors.grayColorTwo.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  margin: EdgeInsets.only(top: screenWidth(3.6)),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/pngs/tabel_header.png",
                        width: screenWidth(1),
                        height: screenWidth(3.5),
                        fit: BoxFit.fill,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: screenWidth(70), right: screenWidth(70)),
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(screenWidth(150)),
                            2: FlexColumnWidth(),
                            3: FlexColumnWidth(),
                            4: FlexColumnWidth(),
                            5: FlexColumnWidth(),
                            6: FlexColumnWidth()
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(children: [
                              tabelElemente(title: "ترتيب"),
                              tabelElemente(
                                title: "الفريق",
                                width: screenWidth(80),
                              ),
                              tabelElemente(title: "لعب"),
                              tabelElemente(
                                title: "فاز",
                                linearGradient: AppColors.linearGradientFive,
                              ),
                              tabelElemente(
                                title: "تعادل",
                                linearGradient: AppColors.linearGradientfour,
                              ),
                              tabelElemente(
                                title: "خسر",
                                linearGradient: AppColors.linearGradientThree,
                              ),
                              tabelElemente(title: "نقاط")
                            ]),
                            ...List.generate(
                                visibileItem == 2
                                    ? (controller.standing.value.football!
                                                .length >
                                            4
                                        ? 4
                                        : controller
                                            .standing.value.football!.length)
                                    : controller
                                        .standing.value.football!.length,
                                (index) => TableRow(children: [
                                      tabelElemente(
                                        title: (index + 1).toString(),
                                      ),
                                      tabelElemente(
                                          title: controller.standing.value
                                              .football![index].name!),
                                      tabelElemente(
                                        title: controller.standing.value
                                                .football![index].play ??
                                            "",
                                      ),
                                      tabelElemente(
                                        title: controller.standing.value
                                                .football![index].win ??
                                            "",
                                      ),
                                      tabelElemente(
                                        title: controller.standing.value
                                                .football![index].draw ??
                                            "",
                                      ),
                                      tabelElemente(
                                        title: controller.standing.value
                                                .football![index].lose ??
                                            "",
                                      ),
                                      tabelElemente(
                                        title: controller.standing.value
                                                .football![index].points ??
                                            "",
                                      ),
                                    ]))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: screenWidth(15),
                        left: screenWidth(30),
                        right: screenWidth(30)),
                    height: screenWidth(4.9),
                    width: screenWidth(1.1),
                    child: Center(
                      child: FittedBox(
                        child: CustomText(
                          text: "جدول ترتيب فرق الدوري السوري " +
                              controller.selectedSeasonsName.value,
                          styleType: TextStyleType.CUSTOM,
                          fontSize: screenWidth(23),
                          fontWeight: FontWeight.w800,
                          textColor: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                visibileItem == 2
                    ? Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: screenWidth(40), bottom: screenWidth(40)),
                          width: screenWidth(2.2),
                          height: screenWidth(12),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.orangeColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: CustomText(
                              text: "شاهد كامل الجدول",
                              textColor: AppColors.blueColorOne,
                            ),
                            onPressed: () {
                              Get.to(() => FullTabel());
                            },
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ));
  }
}

class tabelElemente extends StatelessWidget {
  final String title;
  final double? width;
  final LinearGradient? linearGradient;
  const tabelElemente({
    super.key,
    required this.title,
    this.linearGradient,
    this.width,
  });

  @override
  Widget build(BuildContext contitle) {
    return Container(
      padding: EdgeInsets.only(top: screenWidth(100)),
      decoration: BoxDecoration(
          // color: AppColors.grayColor,
          border: Border.all(
              width: screenWidth(screenWidth(1) * 10),
              color: AppColors.blackColor)),
      width: width,
      height: screenWidth(10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: FittedBox(
                child: CustomText(
                  text: title,
                  styleType: TextStyleType.CUSTOM,
                  fontSize: screenWidth(35),
                  fontWeight: FontWeight.w800,
                  max_lines: 1,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: screenWidth(60),
              width: double.infinity,
              decoration: BoxDecoration(gradient: linearGradient),
            )
          ],
        ),
      ),
    );
  }
}
