import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/sign_in_model/sign_in_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/sign_in_service/sign_in_servide.dart';

class SignInProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void onSignUpButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed('signUpScreen');
  }

  void onForgotButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.forgotPassword);
  }

  void onSignIn(
      GlobalKey<FormState> signInFormKey, BuildContext context) async {
    isLoading = true;
    final signInModel = SignInModel(
        email: emailController.text, password: passwordController.text);

    if (signInFormKey.currentState!.validate()) {
      log('sign in function called');
      SignInService().signInFunction(signInModel).then(
        (value) {
          if (value != null) {
            isLoading = false;
            Navigator.of(context).pushNamed(RouteNames.homeScreen);
          }
        },
      );
    }
  }
}
