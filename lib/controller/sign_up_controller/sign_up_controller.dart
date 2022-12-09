import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/otp_verification/otp_screen_action_enum.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/forgot_password_service/get_user_service.dart';
import 'package:time4deal/service/otp_service/otp_service.dart';
import 'package:time4deal/utils/custom_toast.dart';
import 'package:time4deal/view/otp_screen/otp_arguments.dart';

class SignUpProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController mobController = TextEditingController();

  bool isObscure = true;
  bool isLoading = false;

  void onSignUpButtonPressed(
      GlobalKey<FormState> signUpFormKey, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final signUpModel = SignUpModel(
        fullname: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: mobController.text);

    log(signUpModel.toJson().toString());

    if (signUpFormKey.currentState!.validate()) {
      await GetUserService().getUser(emailController.text).then((value) {
        if (value == null) {
          OtpServices().sendOtp(signUpModel.email);
          final args = OtpArguments(
              signUpModel: signUpModel,
              otpScreenActionEnum: OtpScreenActionEnum.signUpOtp);
          isLoading = false;
          notifyListeners();

          Navigator.pushNamed(context, RouteNames.otpVerificationScreen,
              arguments: args);
        } else {
          customToast('Email already regitered', AppColors.redColor);
          isLoading = false;
          notifyListeners();
        }
      });
    }
  }

  //Function to go to sign in page
  void onSignInButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.signInScreen);
  }

  void setObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
