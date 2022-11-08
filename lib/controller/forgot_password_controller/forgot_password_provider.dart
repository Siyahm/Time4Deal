import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/otp_verification/otp_screen_action_enum.dart';
import 'package:time4deal/models/user_model/user_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/forgot_password_service/get_user_service.dart';
import 'package:time4deal/service/otp_service/otp_service.dart';
import 'package:time4deal/utils/custom_toast.dart';
import 'package:time4deal/view/otp_screen/otp_arguments.dart';

class ForgotPasswordProvider with ChangeNotifier {
  final TextEditingController emailFieldControl = TextEditingController();

  UserModel? user;
  bool isLoading = false;

  void onSendButtonPressed(
      GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      // ForgotPasswordModel forgotPasswordModel =
      //     ForgotPasswordModel(email: emailFieldControl.text);
      final args = OtpArguments(
          otpScreenActionEnum: OtpScreenActionEnum.forgotPasswordOtp);
      user = await GetUserService().getUser(emailFieldControl.text);
      if (user != null) {
        OtpServices().sendOtp(user!.email).then((value) {
          isLoading = false;
          notifyListeners();
          Navigator.pushNamed(context, RouteNames.otpVerificationScreen,
              arguments: args);
        });

        log('send OTP');
      } else {
        customToast('User already exist', AppColors.redColor);
        log('nothing');
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
