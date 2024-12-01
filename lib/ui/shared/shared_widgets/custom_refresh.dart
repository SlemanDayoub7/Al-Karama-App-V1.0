import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefreshableList extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget widget;
  final bool? havePadding;
  RefreshableList(
      {required this.onRefresh, required this.widget, this.havePadding = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          color: AppColors.blueColorOne,
          onRefresh: onRefresh,
          child: Padding(
            padding: havePadding!
                ? EdgeInsets.only(
                    right: screenWidth(28),
                    left: screenWidth(28),
                  )
                : EdgeInsets.zero,
            child: widget,
          ),
          notificationPredicate: (ScrollNotification notification) {
            if (notification.depth == 0) {
              return true;
            }
            return false;
          },
        )
      ],
    );
  }
}
