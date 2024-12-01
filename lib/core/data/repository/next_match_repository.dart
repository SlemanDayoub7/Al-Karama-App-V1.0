import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/common_response.dart';

import 'package:al_karama_app/core/data/models/next_match_model.dart';

import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:al_karama_app/core/utils/network_util.dart';

class NextMatchRepository {
  Future<Either<String, NextMatchModel>> getNextMatch() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/next/matche',
        body: {'sport': '${storage.getSportType()}'},
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(NextMatchModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
