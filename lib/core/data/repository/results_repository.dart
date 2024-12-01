import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/common_response.dart';
import 'package:al_karama_app/core/data/models/seasone_model.dart';
import 'package:al_karama_app/core/data/models/standing_model.dart';
import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:al_karama_app/core/utils/network_util.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

class ResultsRepository {
  Future<Either<String, List<SeasoneModel>>> getSeasons() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/seasone/all',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<SeasoneModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(SeasoneModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, StandingModel>> getStanding(String seasoneId) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.POST,
              route: 'api/standing',
              body: {"seasone": seasoneId, "sport": storage.getSportType()})
          .then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(StandingModel.fromJson(commonResponse.data!));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
