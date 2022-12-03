import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/user_model/user_model.dart';

class GetUserService {
  Future<UserModel?> getUser(String email) async {
    log('get user called');
    try {
      const url = AppUrls.baseUrl + ApiEndPoints.checkUser;
      log(email.toString());
      final Response<dynamic> response = await Dio().get(
        url,
        queryParameters: {'email': email},
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == 201) {
        // customToast('User not found', Colors.red);
        return null;
      }
      log(response.statusCode.toString());
    } catch (e) {
      log('entered catch');
      log(e.toString());
      AppExceptions.handleError(e);
    }
    return null;
  }
}
