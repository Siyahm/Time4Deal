import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/sign_up_controller/sign_up_provider.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/utils/common_validations.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/long_elevated_button.dart';

import '../../widgets/custome_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signUProvider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const CustomAppBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.horizPadding15,
          child: Form(
            key: signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBoxes.heightBox10,
                const Text(
                  'Sign up',
                  style: AppTextStyles.mainTitle,
                ),
                SizedBoxes.heightBox40,
                CustomTextFormField(
                  controller: signUProvider.nameController,
                  text: 'Name',
                  validation: (String? value) {
                    return CommonValidations.nameValidation(value);
                  },
                ),
                SizedBoxes.heightBox10,
                CustomTextFormField(
                  controller: signUProvider.mobController,
                  text: 'Mobile Number',
                  validation: (String? value) {
                    return CommonValidations.mobValidation(value);
                  },
                ),
                SizedBoxes.heightBox10,
                CustomTextFormField(
                  controller: signUProvider.emailController,
                  text: 'Email',
                  validation: (String? value) {
                    return CommonValidations.emailValidation(value);
                  },
                ),
                SizedBoxes.heightBox10,
                CustomTextFormField(
                  controller: signUProvider.passwordController,
                  text: 'Password',
                  validation: (String? value) {
                    return CommonValidations.passwordValidation(value);
                  },
                ),
                SizedBoxes.heightBox20,
                LongElevatedButton(
                  onPressed: () {
                    signUProvider.onSignUpButtonPressed(signUpFormKey, context);
                  },
                  text: 'SIGN UP',
                ),
                SizedBoxes.heightBox20,
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: AppColors.greyColor,
                        thickness: 1,
                      ),
                    ),
                    SizedBoxes.widthBox5,
                    Text(
                      'or',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBoxes.widthBox5,
                    Expanded(
                      child: Divider(
                        color: AppColors.greyColor,
                        thickness: 1,
                      ),
                    )
                  ],
                ),
                SizedBoxes.heightBox20,
                const Center(
                  child: Text('Sign up with'),
                ),
                SizedBoxes.heightBox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                            'lib/assets/google icon.png',
                          )),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBoxes.widthBox20,
                    GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                            'lib/assets/fb Icon.webp',
                          )),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBoxes.heightBox30,
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text:
                        TextSpan(text: 'Already have an account?  ', children: [
                      TextSpan(
                          text: 'Sign In',
                          style: AppTextStyles.butonTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              signUProvider.onSignInButtonPressed(context);
                            })),
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
