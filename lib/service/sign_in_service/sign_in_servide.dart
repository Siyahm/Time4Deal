import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/sign_in_model/sign_in_model.dart';

class SignInService {
  Future<SignInModel?> signInFunction(SignInModel signInModel) async {
    try {
      const url = AppUrls.mainUrl + ApiEndPoints.signIn;
      final Response<dynamic> response = await Dio().post(
        url,
        data: jsonEncode(
          signInModel.toJson(),
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return SignInModel.fromJson(response.data);
      }
      log(response.data.toString());
    } catch (e) {
      // log(e.toString());
      AppExceptions.handleError(e);
    }
    return null;
  }
}
