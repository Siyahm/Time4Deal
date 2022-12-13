import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/carousal_model/carousal_model.dart';
import 'package:time4deal/utils/dio.interceptors.dart';

class GetCarousalService {
  Future<List<CarousalModel>?> getCarousal() async {
    Dio dios = await InterceptorApi().getUserApi();
    try {
      log('carousel cald');

      const url = AppUrls.baseUrl + ApiEndPoints.getCarousal;
      final Response response = await dios.get(url);
      // log('carousel called${response.data.toString()}');
      log(response.statusCode.toString());

      if (response.statusCode! <= 299 && response.statusCode! >= 200) {
        // log('hey called');
        List<CarousalModel> list = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();
        return list;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
