import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model.dart';
import 'package:time4deal/service/sign_up_service/sign_up_service.dart';

class SignUpProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobController = TextEditingController();

  //Function to send user data to backend
  void onSignUpButtonPressed(GlobalKey<FormState> signUpFormKey) {
    if (signUpFormKey.currentState!.validate()) {
      final signUpModel = SignUpModel(
          fullname: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          phone: mobController.text);

      log('Sign up botton pressed');
      SignUpService().signUpFunction(signUpModel);
    }
  }

  //Function to go to sign in page
  void onSignInButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed('signInScreen');
  }
}
