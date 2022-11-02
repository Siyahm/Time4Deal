import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';

class OtpServices {
  final dio = Dio();

  Future<String?> sendOtp(phone) async {
    try {
      Response response = await dio.get(
        AppUrls.mainUrl + ApiEndPoints.verifyOrSendOtp,
        queryParameters: {'phone': phone},
      );
      log(
        response.statusCode.toString(),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('entered create');
        return response.data['status'];
      } else {
        log('success code is not 200 - 299');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
