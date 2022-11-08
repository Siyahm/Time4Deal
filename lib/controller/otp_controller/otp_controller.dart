import 'package:flutter/cupertino.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/otp_verification/otp_screen_action_enum.dart';
import 'package:time4deal/models/otp_verification/otp_verification.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/otp_service/otp_service.dart';
import 'package:time4deal/service/sign_up_service/sign_up_service.dart';
import 'package:time4deal/utils/custom_toast.dart';

class OtpProvider with ChangeNotifier {
  bool isLoading = false;
  String? otp;
  void sendOtp(phone) {
    OtpServices().sendOtp(phone);
  }

  //Function to send user data to backend
  void onPressedSubmitButton(
      SignUpModel? signUpModel,
      OtpVerificationModel otpVerificationModel,
      OtpScreenActionEnum otpEnum,
      BuildContext context) async {
    if (otp == null) {
      return customToast('Please enter OTP', AppColors.redColor);
    } else {
      isLoading = true;
      notifyListeners();
      OtpServices().verifyOtp(otpVerificationModel).then((value) {
        if (value == true) {
          if (otpEnum == OtpScreenActionEnum.signUpOtp) {
            SignUpService().signUp(signUpModel!).then((value) {
              isLoading = false;
              notifyListeners();
              Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen);
            });
          } else if (otpEnum == OtpScreenActionEnum.forgotPasswordOtp) {
            isLoading = false;
            notifyListeners();
            Navigator.of(context)
                .pushReplacementNamed(RouteNames.passwordReset);
          } else if (otpEnum == OtpScreenActionEnum.editUserOtp) {
            //
          }
        } else {
          isLoading = false;
          notifyListeners();
          return customToast('Invalid OTP', AppColors.redColor);
        }
      });
    }
  }
}
