// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model.dart';
import 'package:time4deal/service/otp_service/otp_service.dart';
import 'package:time4deal/view/otp_screen/otp_arguments.dart';

class SignUpProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobController = TextEditingController();

  bool isObscure = false;

  void onSignUpButtonPressed(
      GlobalKey<FormState> signUpFormKey, BuildContext context) async {
    final signUpModel = SignUpModel(
        fullname: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: mobController.text);

    log(signUpModel.toJson().toString());

    if (signUpFormKey.currentState!.validate()) {
      await OtpServices().sendOtp(signUpModel.phone);
      final args = OtpArguments(signUpModel: signUpModel);

      Navigator.pushNamed(context, 'otpVerificationScreen', arguments: args);
    }
  }

  //Function to go to sign in page
  void onSignInButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed('signInScreen');
  }

  void setObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
