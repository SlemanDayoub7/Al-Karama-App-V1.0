import 'package:al_karama_app/core/data/models/match_detail_model.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/data/models/stuff_model.dart';
import 'package:al_karama_app/core/enums/cart_type.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/player_detail_view.dart/player_detail_view.dart';
import 'package:get/get.dart';

class CustomPlayerCart extends StatelessWidget {
  final CartType cartType;
  final Attack? player;
  final Managers? manager;
  final Beanched? beanched;
  final Inplayer? switchPlayer;
  const CustomPlayerCart({
    super.key,
    required this.cartType,
    this.color,
    this.player,
    this.manager,
    this.beanched,
    this.switchPlayer,
  });

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          String id = '';
          if (cartType == CartType.PLAYER) {
            id = player!.uuid ?? "";
          } else if (cartType == CartType.SWITCH) {
            id = switchPlayer!.uuid ?? "";
          }
          cartType == CartType.PLAYER || cartType == CartType.SWITCH
              ? Get.to(() => PlayerDetailView(
                    id: id,
                  ))
              : null;
        },
        child: cartType == CartType.BENCH
            ? Container(
                height: screenWidth(1.8),
                width: screenWidth(2.5),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: screenWidth(360),
                              color: AppColors.blackColor),
                          color: AppColors.blueColorOne,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        ),
                        width: screenWidth(2),
                        height: screenWidth(2.6),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: screenWidth(2.8),
                            height: screenWidth(2.2),
                            child: Center(
                              child: CustomImage(
                                url: beanched!.image ?? "",
                                width: screenWidth(2.8),
                                fit: BoxFit.fill,
                                height: screenWidth(2.2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenWidth(60),
                          ),
                          FittedBox(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth(70),
                                  right: screenWidth(70)),
                              child: CustomText(
                                  text: beanched!.name ?? "",
                                  styleType: TextStyleType.TITLE,
                                  textColor: AppColors.whiteColor),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Container(
                height: cartType == CartType.SWITCH
                    ? screenWidth(1.76)
                    : screenWidth(1.5),
                width: cartType == CartType.SWITCH
                    ? screenWidth(2.5)
                    : screenWidth(2),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: screenWidth(360),
                              color: AppColors.blackColor),
                          color: cartType == CartType.PLAYER ||
                                  cartType == CartType.SWITCH
                              ? AppColors.blueColorOne
                              : cartType == CartType.GOALKEAPR
                                  ? AppColors.yellowColor
                                  : AppColors.grayColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        ),
                        width: screenWidth(2),
                        height: screenWidth(2.6),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth(40)),
                        child: cartType == CartType.PLAYER ||
                                cartType == CartType.GOALKEAPR ||
                                cartType == CartType.SWITCH
                            ? cartType != CartType.SWITCH
                                ? FittedBox(
                                    child: Container(
                                      width: screenWidth(2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomAbilitie(
                                            text: player!.age ?? "",
                                            title: 'العمر',
                                          ),
                                          SizedBox(
                                            width: screenWidth(100),
                                          ),
                                          CustomAbilitie(
                                            text: player!.high ?? "",
                                            title: 'الطول',
                                          ),
                                          SizedBox(
                                            width: screenWidth(100),
                                          ),
                                          CustomAbilitie(
                                            text: player!.number ?? "",
                                            title: 'الرقم',
                                          ),
                                          SizedBox(
                                            width: screenWidth(100),
                                          ),
                                          CustomAbilitie(
                                            text: player!.play ?? "",
                                            title: 'المركز',
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox()
                            : FittedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/pngs/icon_coach.png",
                                      width: screenWidth(9),
                                      height: screenWidth(9),
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: screenWidth(60),
                                    ),
                                    CustomText(
                                      text: (manager!.work ?? ""),
                                      styleType: TextStyleType.BODY,
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: screenWidth(2.8),
                            height: screenWidth(2.2),
                            child: Center(
                              child: CustomImage(
                                url: cartType == CartType.PLAYER ||
                                        cartType == CartType.GOALKEAPR
                                    ? player!.image ?? ""
                                    : cartType == CartType.SWITCH
                                        ? switchPlayer!.image ?? ""
                                        : manager!.image ?? "",
                                width: screenWidth(2.8),
                                fit: BoxFit.fill,
                                height: screenWidth(2.2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenWidth(60),
                          ),
                          FittedBox(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth(70),
                                  right: screenWidth(70)),
                              child: CustomText(
                                text: cartType == CartType.PLAYER ||
                                        cartType == CartType.GOALKEAPR
                                    ? player!.name ?? ""
                                    : cartType == CartType.SWITCH
                                        ? switchPlayer!.name ?? ""
                                        : manager!.name ?? "",
                                styleType: TextStyleType.TITLE,
                                textColor: cartType == CartType.PLAYER ||
                                        cartType == CartType.SWITCH
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }
}

class CustomAbilitie extends StatelessWidget {
  final String text, title;
  final double? fontSize;
  final double? size;
  const CustomAbilitie({
    super.key,
    required this.text,
    this.fontSize,
    this.size,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? screenWidth(9),
      height: size ?? screenWidth(9),
      child: Stack(
        children: [
          Image.asset("assets/images/pngs/detail_player.png",
              width: size ?? screenWidth(9), height: size ?? screenWidth(9)),
          Center(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth(40),
                    right: screenWidth(40),
                    top: screenWidth(50),
                    bottom: screenWidth(50)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(text: title),
                    CustomText(
                      text: text,
                      fontWeight: FontWeight.w800,
                      textAlign: TextAlign.center,
                      styleType: TextStyleType.BODY,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
