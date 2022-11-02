import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/sign_up_controller/sign_up_provider.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/view/sign_up/sign_up_screen.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/long_elevated_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
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
                'Please enter One-Time Password received in your registered mobile number',
                style: AppTextStyles.normalText,
                textAlign: TextAlign.justify,
              ),
              SizedBoxes.heightBox20,
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                fieldWidth: 35,
                enabledBorderColor: AppColors.greyColor,
                focusedBorderColor: AppColors.whiteColor,
                cursorColor: AppColors.dimWhiteColor,
              ),
              SizedBoxes.heightBox20,
              SizedBoxes.heightBox30,
              LongElevatedButton(
                onPressed: () {
                  signUpProvider.onSignUp(SignUpScreen().signUpFormKey);
                },
                text: 'SUBMIT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
