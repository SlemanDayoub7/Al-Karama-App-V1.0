import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/common_response.dart';
import 'package:al_karama_app/core/data/models/seasone_model.dart';
import 'package:al_karama_app/core/data/models/sports_model.dart';
import 'package:al_karama_app/core/data/models/standing_model.dart';
import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:al_karama_app/core/utils/network_util.dart';

class SportsRepository {
  Future<Either<String, List<SportsModel>>> getSports() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/sport/all',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          List<SportsModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(SportsModel.fromJson(element));
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
}
