import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/forgot_password_controller/forgot_password_provider.dart';
import 'package:time4deal/controller/otp_controller/otp_controller.dart';
import 'package:time4deal/controller/sign_up_controller/sign_up_provider.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/models/otp_verification/otp_screen_action_enum.dart';
import 'package:time4deal/models/otp_verification/otp_verification.dart';
import 'package:time4deal/models/sign_up_model/sign_up_model.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/long_elevated_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
    required this.signUpModel,
    required this.otpScreenActionEnum,
  });
  final SignUpModel? signUpModel;
  final OtpScreenActionEnum otpScreenActionEnum;

  @override
  Widget build(BuildContext context) {
    // final signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    final otpProvider = Provider.of<OtpProvider>(context, listen: false);
    final forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const CustomAppBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.horizPadding15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxes.heightBox50,
              const Text(
                'OTP Verification',
                style: AppTextStyles.mainTitle,
              ),
              SizedBoxes.heightBox50,
              const Text(
                'Please enter One-Time Password received in your email',
                style: AppTextStyles.normalText,
                textAlign: TextAlign.justify,
              ),
              SizedBoxes.heightBox20,
              OtpTextField(
                numberOfFields: 4,
                showFieldAsBox: true,
                fieldWidth: 50,
                enabledBorderColor: AppColors.greyColor,
                focusedBorderColor: AppColors.whiteColor,
                cursorColor: AppColors.dimWhiteColor,
                onSubmit: (code) {
                  otpProvider.otp = code;
                },
              ),
              SizedBoxes.heightBox50,
              Consumer<OtpProvider>(
                builder: (context, value, child) {
                  return LongElevatedButton(
                    onPressed: () {
                      if (otpScreenActionEnum ==
                          OtpScreenActionEnum.signUpOtp) {
                        final model = OtpVerificationModel(
                            otp: value.otp, email: signUpModel!.email);

                        // log("I am model ${model.toJson().toString()}");
                        value.onPressedSubmitButton(
                            signUpModel, model, otpScreenActionEnum, context);
                      } else if (otpScreenActionEnum ==
                          OtpScreenActionEnum.forgotPasswordOtp) {
                        final model = OtpVerificationModel(
                            otp: value.otp,
                            email: forgotPasswordProvider.user!.email);

                        // log("I am model ${model.toJson().toString()}");
                        value.onPressedSubmitButton(
                            signUpModel, model, otpScreenActionEnum, context);
                      }
                    },
                    child: value.isLoading == true
                        ? const CircularProgressIndicator()
                        : const Text('SUBMIT'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
