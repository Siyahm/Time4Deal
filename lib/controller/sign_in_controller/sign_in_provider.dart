import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/user_model/user_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/sign_in_service/sign_in_servide.dart';

class SignInProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isLoadingGoogle = false;

  void onSignUpButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed('signUpScreen');
  }

  void onForgotButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.forgotPassword);
  }

  void onSignIn(
      GlobalKey<FormState> signInFormKey, BuildContext context) async {
    isLoading = true;
    // final signInModel = SignInModel(
    //     email: emailController.text, password: passwordController.text);

    if (signInFormKey.currentState!.validate()) {
      log('sign in function called');
      UserModel? user = await SignInService()
          .signInFunction(
              email: emailController.text, password: passwordController.text)
          .then(
        (value) {
          if (value != null) {
            isLoading = false;
            Navigator.of(context).pushNamed(RouteNames.homeScreen);
            // log(user.toString());
          }

          return null;
        },
      );
      log(user.toString());
    }
  }

  void googleLogin(BuildContext context) async {
    isLoadingGoogle = true;
    notifyListeners();
    await SignInService().googleSignIn().then((value) {
      log('called');
      if (value != null) {
        isLoadingGoogle = false;
        notifyListeners();
        Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen);
      } else {
        isLoadingGoogle = false;
        notifyListeners();
      }
    });
  }
}
