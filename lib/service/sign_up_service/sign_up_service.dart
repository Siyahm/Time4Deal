import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model.dart';

class SignUpService {
  Future<SignUpModel?> signUp(SignUpModel signUpModel) async {
    log('signup function called');
    try {
      const url = AppUrls.mainUrl + ApiEndPoints.signUp;
      final Response<dynamic> response = await Dio().post(
        url,
        data: jsonEncode(
          signUpModel.toJson(),
        ),
      );
      log(response.data.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return SignUpModel.fomJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
