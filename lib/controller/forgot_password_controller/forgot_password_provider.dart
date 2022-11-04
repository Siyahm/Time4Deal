import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/forgot_password/forgot_password.dart';
import 'package:time4deal/models/otp_verification/otp_screen_action_enum.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/forgot_password_service/forgot_password_service.dart';
import 'package:time4deal/service/otp_service/otp_service.dart';
import 'package:time4deal/view/otp_screen/otp_arguments.dart';

class ForgotPasswordProvider with ChangeNotifier {
  final TextEditingController emailFieldControl = TextEditingController();
  ForgotPasswordModel? forgotPasswordModel;
  ForgotPasswordModel? user;
  bool isLoading = false;

  void onSendButtonPressed(
      GlobalKey<FormState> formKey, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      ForgotPasswordModel forgotPasswordModel =
          ForgotPasswordModel(email: emailFieldControl.text);
      final args = OtpArguments(
          otpScreenActionEnum: OtpScreenActionEnum.forgotPasswordOtp);
      user = await ForgotPasswordService().getUser(forgotPasswordModel);
      if (user != null) {
        OtpServices().sendOtp(user!.phone).then((value) {
          isLoading = false;
          notifyListeners();
          Navigator.pushNamed(context, RouteNames.otpVerificationScreen,
              arguments: args);
        });

        log('send OTP');
      }
      isLoading = false;
      notifyListeners();
    }
  }
}
