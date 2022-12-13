import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/utils/custom_toast.dart';
import 'package:time4deal/utils/navigation_context.dart';

class AppExceptions {
  static void handleError(Object e) {
    if (e is PlatformException) {
      customToast('Platform error occured', AppColors.redColor);
    }
    if (e is TimeoutException) {
      customToast('Connection time out', AppColors.redColor);
    }
    if (e is MissingPluginException) {
      customToast('Plugin error occured', AppColors.redColor);
    }
    if (e is DioError) {
      if (e.response?.statusCode == 403 &&
          e.response?.data['message'] == 'Forbidden') {
        log('Refresh token expired, Log out');
        //navigating to login screen
        Navigator.of(
                NavigationContextService.navigatorContextKey.currentContext!)
            .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
      }
      if (e.response?.data["message"] != null) {
        customToast(e.response!.data["message"].toString(), AppColors.redColor);
      }
      if (e.type == DioErrorType.cancel) {
        customToast('Request Cancelled', AppColors.redColor);
      } else if (e.error is SocketException) {
        customToast('No Internet Connection', AppColors.redColor);
      } else if (e.type == DioErrorType.connectTimeout) {
        customToast('Connection Time out', AppColors.redColor);
      } else if (e.type == DioErrorType.receiveTimeout) {
        customToast('Receiver Time out', AppColors.redColor);
      } else if (e.type == DioErrorType.sendTimeout) {
        customToast('Send Time out', AppColors.redColor);
      } else if (e.type == DioErrorType.other) {
        customToast('Oops..!! Something went wrong', AppColors.redColor);
      }
    }
  }
}
