import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:time4deal/helpers/app_exceptions.dart';

class GoogleSignInService {
  Future<void> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      log(result.toString());
      log(result!.displayName.toString());
    } catch (e) {
      AppExceptions.handleError(e);
    }
  }
}
