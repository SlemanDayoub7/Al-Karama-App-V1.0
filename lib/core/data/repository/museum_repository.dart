import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/common_response.dart';
import 'package:al_karama_app/core/data/models/museum_model.dart';

import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:al_karama_app/core/utils/network_util.dart';

class MuseumRepository {
  Future<Either<String, MuseumModel>> getMuseum() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/museum',
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(MuseumModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
