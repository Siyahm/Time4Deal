import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/models/otp_verification/otp_verification.dart';

class OtpServices {
  final dio = Dio();

  Future<String?> sendOtp(email) async {
    try {
      Response response = await dio.get(
        AppUrls.mainUrl + ApiEndPoints.verifyOrSendOtp,
        queryParameters: {'email': email},
      );
      log(email.toString());
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

  Future<bool> verifyOtp(OtpVerificationModel otpVerificationModel) async {
    try {
      log('try entered');
      const url = AppUrls.mainUrl + ApiEndPoints.verifyOrSendOtp;
      Response response = await Dio().post(
        url,
        data: jsonEncode(
          otpVerificationModel.toJson(),
        ),
      );
      log(
        response.statusCode.toString(),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return true;
      }
    } catch (e) {
      log(
        e.toString(),
      );
    }
    return false;
  }
}
