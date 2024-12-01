import 'package:flutter/material.dart';
import 'package:al_karama_app/core/data/models/news_model.dart';
import 'package:al_karama_app/core/data/models/statistics_model.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomStatistics extends StatelessWidget {
  final List<Statistics> list;
  final Club1 club1, club2;
  const CustomStatistics(
      {super.key,
      required this.list,
      required this.club1,
      required this.club2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: screenWidth(20), bottom: screenWidth(30)),
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(15)),
      width: screenWidth(1),
      //height: screenWidth(1),
      child: Center(
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.blueColorOne,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  height: screenWidth(50),
                ),
              ),
              SizedBox(
                width: screenWidth(30),
              ),
              CustomText(text: club1.name ?? ""),
              CustomImage(
                url: club1.logo!,
                width: screenWidth(8),
                height: screenWidth(8),
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: screenWidth(30),
              ),
              CustomImage(
                url: club2.logo!,
                width: screenWidth(8),
                height: screenWidth(8),
                fit: BoxFit.fill,
              ),
              CustomText(text: club2.name ?? ""),
              SizedBox(
                width: screenWidth(30),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.blueColorOne,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  height: screenWidth(50),
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth(30)),
          ...List.generate(
            list.length,
            (index) => Column(
              children: [
                CustomText(text: list[index].name ?? ""),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth(30), right: screenWidth(30)),
                  child: LinearPercentIndicator(
                      barRadius: Radius.circular(10),
                      leading: CustomText(text: list[index].value!.team1!),
                      lineHeight: screenWidth(50),
                      percent: list[index].value!.team1 != null &&
                              list[index].value!.team2 != null
                          ? int.parse(list[index].value!.team2!) /
                              (int.parse(list[index].value!.team1!) +
                                  int.parse(list[index].value!.team2!))
                          : 0.0,
                      backgroundColor: AppColors.blueColorOne,
                      progressColor: AppColors.orangeColor,
                      trailing: CustomText(text: list[index].value!.team2!)),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
