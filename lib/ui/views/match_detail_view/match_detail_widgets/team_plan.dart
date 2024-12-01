import 'package:flutter/material.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

import '../../../shared/custom_widgets/custom_image.dart';

class TeamPlane extends StatelessWidget {
  final String plan;
  const TeamPlane({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1),
      height: screenWidth(0.70),
      child: CustomImage(
        url: plan,
        width: screenWidth(1),
        height: screenWidth(0.70),
        fit: BoxFit.fill,
      ),
    );
  }
}
