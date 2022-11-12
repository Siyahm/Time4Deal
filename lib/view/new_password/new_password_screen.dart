import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/forgot_password_controller/forgot_password_provider.dart';
import 'package:time4deal/controller/new_password_conttoller/new_password_provider.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/utils/common_validations.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/custome_text_form_field.dart';
import 'package:time4deal/widgets/long_elevated_button.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final newPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final newPasswordProvider = Provider.of<NewPasswordProvider>(context);
    final forgotPasswordProvider = Provider.of<ForgotPasswordProvider>(context);
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
                'Forgot Password',
                style: AppTextStyles.mainTitle,
              ),
              SizedBoxes.heightBox50,
              const Text(
                'Please enter your registered email address',
                style: AppTextStyles.normalText,
                textAlign: TextAlign.justify,
              ),
              SizedBoxes.heightBox20,
              Form(
                key: newPasswordFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: newPasswordProvider.newPasswordController,
                      text: 'New Password',
                      validation: (String? value) {
                        return CommonValidations.passwordValidation(value);
                      },
                    ),
                    SizedBoxes.heightBox10,
                    CustomTextFormField(
                      controller: newPasswordProvider.confirmPasswordController,
                      text: 'Conform Password',
                      validation: (String? value) {
                        return CommonValidations.confirmPasswordValidation(
                            value,
                            newPasswordProvider.newPasswordController.text);
                      },
                    ),
                  ],
                ),
              ),
              SizedBoxes.heightBox30,
              LongElevatedButton(
                color: AppColors.themeColor,
                onPressed: () {
                  newPasswordProvider.onResetButtonPressed(newPasswordFormKey,
                      context, forgotPasswordProvider.user!.email!);
                },
                child: const Text(
                  'RESET',
                  style: AppTextStyles.buttonTextBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
