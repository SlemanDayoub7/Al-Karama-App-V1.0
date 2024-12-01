import 'package:flutter/material.dart';
import 'package:al_karama_app/core/data/models/news_model.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/details_news_view/details_news_widgets/custom_statistics.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_video.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../shared/custom_widgets/custom_image.dart';

class DetailsNewsView extends StatelessWidget {
  final NewsModel newsModel;
  final List<String> imagesUrl;
  DetailsNewsView(
      {super.key, required this.newsModel, required this.imagesUrl});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        title: "صفحة الخبر",
        backGroundColor: AppColors.backGroundColor,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: screenWidth(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: CustomImage(
                  url: newsModel.image!,
                  width: screenWidth(1),
                  fit: BoxFit.fill,
                  height: screenWidth(1.8),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenWidth(2)),
            padding: EdgeInsets.all(screenWidth(25)),
            decoration: BoxDecoration(
                color: AppColors.blueColorOne,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            height: screenHeight(1),
            child: SingleChildScrollView(
              child: AnimationLimiter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 500),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: screenWidth(2),
                        child: FadeInAnimation(child: widget),
                      ),
                      children: [
                        CustomText(
                          overflow: TextOverflow.visible,
                          text: newsModel.title ?? "",
                          textColor: AppColors.whiteColor,
                          styleType: TextStyleType.SUBTITLE,
                        ),
                        SizedBox(
                          height: screenWidth(30),
                        ),
                        CustomText(
                          overflow: TextOverflow.visible,
                          fontWeight: FontWeight.w800,
                          text: newsModel.content ?? "",
                          textColor: AppColors.whiteColor,
                          styleType: TextStyleType.BODY,
                        ),
                        SizedBox(
                          height: screenWidth(30),
                        ),
                        // newsModel.statistics != null
                        //     ? CustomText(
                        //         text: "احصائيات المباراة",
                        //         textColor: AppColors.whiteColor,
                        //         styleType: TextStyleType.SUBTITLE,
                        //         fontWeight: FontWeight.w800,
                        //       )
                        //     : SizedBox(),
                        SizedBox(
                          height: screenWidth(30),
                        ),
                        newsModel.statistics != null
                            ? newsModel.statistics!.length == 0
                                ? SizedBox()
                                : CustomStatistics(
                                    list: newsModel.statistics!,
                                    club1: newsModel.club1!,
                                    club2: newsModel.club2!,
                                  )
                            : SizedBox(),
                        SizedBox(
                          height: screenWidth(30),
                        ),
                        newsModel.videos == null
                            ? SizedBox()
                            : ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: screenWidth(40),
                                  );
                                },
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: newsModel.videos!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomVideo(
                                    title:
                                        newsModel.videos![index].description ??
                                            "",
                                    videoUrl:
                                        newsModel.videos![index].url ?? "",
                                    imageUrl: imagesUrl[index],
                                  );
                                },
                              ),
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
