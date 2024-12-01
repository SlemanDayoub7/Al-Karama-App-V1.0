import 'package:flutter/material.dart';
import 'package:al_karama_app/core/enums/shimmer_type.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final ShimmerType shimmerType;
  final Widget? widget;
  final Axis? axis;
  final double? width;
  final double? margin;
  final double? height;
  const CustomShimmer(
      {super.key,
      required this.shimmerType,
      this.widget,
      this.axis = Axis.vertical,
      this.width,
      this.height,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: widget ?? getWidget(), direction: ShimmerDirection.ltr,
      baseColor: Colors.grey.withOpacity(0.1), // The base color of the shimmer
      highlightColor:
          Colors.grey.withOpacity(0.2), // The highlight color of the shimmer
      // The direction of the shimmer
      loop: -1,
    );
  }

  Widget getWidget() {
    Widget widget = SizedBox();
    switch (shimmerType) {
      case ShimmerType.GROUP:
        {
          widget = Padding(
            padding: margin == null
                ? EdgeInsets.zero
                : EdgeInsets.only(bottom: margin!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: screenWidth(11),
                  width: screenWidth(3),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(30)),
                ),
                SizedBox(
                  height: screenWidth(30),
                ),
                Container(
                  width: screenWidth(1),
                  height: height ?? screenWidth(2.5),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: height ?? screenWidth(4),
                          width: width ?? screenWidth(3.3),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(25)),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: screenWidth(25),
                        );
                      },
                      itemCount: 4),
                )
              ],
            ),
          );
        }
        break;
      case ShimmerType.LIST:
        {
          widget = Container(
            width: screenWidth(1),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: axis!,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: axis != null ? screenWidth(40) : null,
                  height: screenWidth(40),
                );
              },
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: screenWidth(2.1),
                  height: screenWidth(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.backGroundColor,
                  ),
                );
              },
            ),
          );
        }
        break;

      case ShimmerType.CUSTOM:
        {
          widget = SizedBox();
        }
        break;
    }
    return widget;
  }
}
