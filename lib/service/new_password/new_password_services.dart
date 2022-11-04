import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';

class NewPasswordService {
  Future<String?> resetPassword(String email, String newPassword) async {
    try {
      const url = AppUrls.mainUrl + ApiEndPoints.setPassword;
      final Response response = await Dio().post(url, data: {
        'email': email,
        'password': newPassword,
      });
      if (response.statusCode == 202) {
        log(response.data['message']);
        return response.data['message'];
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
