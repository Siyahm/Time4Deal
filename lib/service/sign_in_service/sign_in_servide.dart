import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model_for_token.dart';

class SignInService {
  Future<SignUpModelForToken?> signInFunction(
      {String? email, String? password}) async {
    try {
      const url = AppUrls.mainUrl + ApiEndPoints.signIn;
      final Response<dynamic> response = await Dio().post(
        url,
        data: jsonEncode(
          {'email': email, 'password': password},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return SignUpModelForToken.fromJson(response.data);
      }
      log(response.data.toString());
    } catch (e) {
      // log(e.toString());
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<SignUpModelForToken?> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      const url = AppUrls.mainUrl + ApiEndPoints.googleLogin;
      GoogleSignInAccount? result = await googleSignIn.signIn();
      log('hy');
      log(result!.displayName!);
      Response response = await Dio().post(
        url,
        data: jsonEncode(
          {
            'email': result.email,
            'name': result.displayName,
          },
        ),
      );
      log('message');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return SignUpModelForToken.fromJson(response.data);
      }
      log('hey');
      log(result.toString());
      log(result.displayName.toString());
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
