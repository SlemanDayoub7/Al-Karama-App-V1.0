import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/common_response.dart';
import 'package:al_karama_app/core/data/models/fans_model.dart';
import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:al_karama_app/core/utils/network_util.dart';

class FansRepository {
  Future<Either<String, List<FansModel>>> getFans() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/associations',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<FansModel> result = [];
          commonResponse.data != null
              ? commonResponse.data!.forEach(
                  (element) {
                    result.add(FansModel.fromJson(element));
                  },
                )
              : null;
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
