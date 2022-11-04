import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/forgot_password/forgot_password.dart';
import 'package:time4deal/utils/custom_toast.dart';

class ForgotPasswordService {
  Future<ForgotPasswordModel?> getUser(
      ForgotPasswordModel forgotPasswordModel) async {
    log('get user called');
    try {
      const url = AppUrls.mainUrl + ApiEndPoints.checkUser;
      log(forgotPasswordModel.email.toString());
      final Response<dynamic> response = await Dio().get(
        url,
        queryParameters: forgotPasswordModel.toJson(),
      );
      if (response.statusCode == 200) {
        return ForgotPasswordModel.fromJson(response.data);
      } else if (response.statusCode == 201) {
        customToast('User not found', Colors.red);
        return null;
      }
      log(response.statusCode.toString());
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
