import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/otp_verification/otp_verification.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model.dart';
import 'package:time4deal/service/otp_service/otp_service.dart';
import 'package:time4deal/service/sign_up_service/sign_up_service.dart';
import 'package:time4deal/utils/custom_toast.dart';

class OtpProvider with ChangeNotifier {
  String? otp;
  void sendOtp(phone) {
    OtpServices().sendOtp(phone);
  }

  //Function to send user data to backend
  void onPressedSubmitButton(SignUpModel signUpModel,
      OtpVerificationModel otpVerificationModel) async {
    log('Sign up botton pressed');
    OtpServices().verifyOtp(otpVerificationModel).then((value) {
      if (value == true) {
        SignUpService().signUpFunction(signUpModel);
      } else {
        customToast('Invalid OTP', AppColors.redColor);
      }
    });
  }
}
