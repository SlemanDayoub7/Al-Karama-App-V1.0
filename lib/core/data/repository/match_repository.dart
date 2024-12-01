import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/common_response.dart';
import 'package:al_karama_app/core/data/models/match_detail_model.dart';
import 'package:al_karama_app/core/data/models/match_model.dart';
import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:al_karama_app/core/utils/network_util.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

class MatchRepository {
  Future<Either<String, MatchModel>> getMatches() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          route: 'api/matches/not/started',
          body: {'sport': '${storage.getSportType()}'}).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(MatchModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MatchDetailModel>> getMatcheDetail(
      String matchId) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        body: {"matche": matchId},
        route: 'api/matche/details',
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(MatchDetailModel.fromJson(commonResponse.data!));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MatchModel>> getFinishedMatch() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/matches/finished',
        body: {'sport': '${storage.getSportType()}'},
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(MatchModel.fromJson(commonResponse.data!));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
