import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model_for_token.dart';

class SignUpService {
  Future<SignUpModelForToken?> signUp(SignUpModel signUpModel) async {
    log('signup function called');
    try {
      const url = AppUrls.baseUrl + ApiEndPoints.signUp;
      final Response<dynamic> response = await Dio().post(
        url,
        data: jsonEncode(
          signUpModel.toJson(),
        ),
      );
      log(response.data.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return SignUpModelForToken.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
