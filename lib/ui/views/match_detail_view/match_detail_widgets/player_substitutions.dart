import 'package:al_karama_app/core/data/models/match_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/enums/cart_type.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_image.dart';
import 'package:al_karama_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:al_karama_app/ui/shared/shared_widgets/custom_player_cart.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

import '../../../shared/shared_widgets/custom_player_cart.dart';

class SwitchPlayers extends StatelessWidget {
  final Inplayer inPlayer;
  final Inplayer outPlayer;
  const SwitchPlayers({
    super.key,
    required this.inPlayer,
    required this.outPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          end: screenWidth(30), start: screenWidth(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomPlayerCart(
            switchPlayer: inPlayer,
            cartType: CartType.SWITCH,
          ),
          SizedBox(width: screenWidth(40)),
          Padding(
            padding: EdgeInsets.only(top: screenWidth(8)),
            child: Image.asset(
              "assets/images/pngs/switch.png",
              width: screenWidth(15),
              height: screenWidth(15),
            ),
          ),
          SizedBox(width: screenWidth(40)),
          CustomPlayerCart(
            switchPlayer: outPlayer,
            cartType: CartType.SWITCH,
          ),
        ],
      ),
    );
  }
}
