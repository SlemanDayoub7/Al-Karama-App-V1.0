import 'package:al_karama_app/core/enums/shimmer_type.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomImage extends StatelessWidget {
  final String url;
  final double width, height;
  final BoxFit fit;

  const CustomImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      filterQuality: FilterQuality.high,
      imageUrl: url,
      fit: fit,
      placeholder: (context, url) {
        return CustomShimmer(
          shimmerType: ShimmerType.CUSTOM,
          widget: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.whiteColor),
          ),
        );
      },
      errorWidget: (context, error, stackTrace) {
        return SizedBox(
          width: width,
          height: height,
        );
      },
      width: width,
      height: height,
    );
  }
}
