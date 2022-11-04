import 'package:time4deal/models/otp_verification/otp_screen_action_enum.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model.dart';

class OtpArguments {
  final SignUpModel? signUpModel;
  final OtpScreenActionEnum otpScreenActionEnum;

  OtpArguments({
    this.signUpModel,
    required this.otpScreenActionEnum,
  });
}
