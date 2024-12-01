import 'package:al_karama_app/core/data/models/banner_model.dart';
import 'package:dartz/dartz.dart';
import 'package:al_karama_app/core/data/models/common_response.dart';
import 'package:al_karama_app/core/data/models/news_model.dart';

import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:al_karama_app/core/utils/network_util.dart';

class NewsRepository {
  Future<Either<String, List<NewsModel>>> getAllNews() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/news/all',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<NewsModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(NewsModel.fromJson(element));
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

  Future<Either<String, List<BannerModel>>> getBanners() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/sliders/all',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<BannerModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(BannerModel.fromJson(element));
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
