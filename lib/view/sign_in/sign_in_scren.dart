import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/utils/common_validations.dart';
import 'package:time4deal/controller/sign_in_controller/sign_in_provider.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/widgets/custome_text_form_field.dart';
import 'package:time4deal/widgets/long_elevated_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.horizPadding15,
          child: Form(
            key: signInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBoxes.heightBox150,
                const Text(
                  'Sign In',
                  style: AppTextStyles.mainTitle,
                ),
                SizedBoxes.heightBox50,
                CustomTextFormField(
                  controller: signInProvider.emailController,
                  text: 'Email',
                  validation: (String? value) {
                    return CommonValidations.emailValidation(value);
                  },
                ),
                SizedBoxes.heightBox10,
                CustomTextFormField(
                  controller: signInProvider.passwordController,
                  text: 'Password',
                  validation: (String? value) {},
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () {
                        signInProvider.onForgotButtonPressed(context);
                      },
                      child: const Text('Forgot Password?'),
                    )),
                SizedBoxes.heightBox30,
                LongElevatedButton(
                  onPressed: () {},
                  text: 'SIGN IN',
                ),
                SizedBoxes.heightBox50,
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(text: 'Not registered yet?  ', children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: AppTextStyles.butonTextStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            signInProvider.onSignUpButtonPressed(context);
                          },
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
