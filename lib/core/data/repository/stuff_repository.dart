import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/common_response.dart';
import 'package:al_karama_app/core/data/models/stuff_model.dart';
import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:al_karama_app/core/utils/network_util.dart';
import '../models/player_detail_model.dart';

class StuffRepository {
  Future<Either<String, StuffModel>> getStuff() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/stuff',
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(StuffModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PlayerDetailModel>> getPlayerDetail(String id) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        body: {'player': id},
        route: 'api/player/details',
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(PlayerDetailModel.fromJson(commonResponse.data!));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
