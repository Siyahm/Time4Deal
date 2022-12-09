import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/sign_in_controller/sign_in_provider.dart';
import 'package:time4deal/controller/sign_up_controller/sign_up_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/utils/common_validations.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/google_sign_in_widget.dart';
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
        leading: const CustomAppBarLeadingWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.horizPadding15,
          child: Form(
            key: signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBoxes.heightBox10,
                const Text(
                  'Sign up',
                  style: AppTextStyles.mainTitleDimWhite,
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
                  keyboard: TextInputType.phone,
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
                  suffixIcon: GestureDetector(
                    child: signUProvider.isObscure == false
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onTap: () => signUProvider.setObscure(),
                  ),
                  isObscure: signUProvider.isObscure,
                  controller: signUProvider.passwordController,
                  text: 'Password',
                  validation: (String? value) {
                    return CommonValidations.passwordValidation(value);
                  },
                ),
                SizedBoxes.heightBox10,
                CustomTextFormField(
                  isObscure: true,
                  controller: signUProvider.confirmPasswordController,
                  text: 'Confirm Password',
                  validation: (String? value) {
                    return CommonValidations.confirmPasswordValidation(
                        value, signUProvider.passwordController.text);
                  },
                ),
                SizedBoxes.heightBox20,
                Consumer<SignUpProvider>(
                  builder: (context, value, child) {
                    return LongElevatedButton(
                      color: AppColors.dimWhiteColor,
                      onPressed: () {
                        value.onSignUpButtonPressed(signUpFormKey, context);
                      },
                      child: value.isLoading == true
                          ? const CircularProgressIndicator()
                          : const Text(
                              'SIGN UP',
                              style: AppTextStyles.buttonTextBlack,
                            ),
                    );
                  },
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
                SizedBoxes.heightBox10,
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<SignInProvider>(context, listen: false)
                          .googleLogin(context);
                    },
                    child: const GoogleSignInWidget(),
                    // Container(
                    //   width: 140,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     border: Border.all(
                    //       color: AppColors.whiteColor,
                    //       width: 1.5,
                    //     ),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       const Text('Sign Up with'),
                    //       SizedBoxes.widthBox10,
                    //       Container(
                    //         width: 25,
                    //         height: 25,
                    //         decoration: const BoxDecoration(
                    //           image: DecorationImage(
                    //               image: AssetImage(
                    //             'lib/assets/google icon.png',
                    //           )),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
                SizedBoxes.heightBox30,
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have an account?  ',
                        style: const TextStyle(color: AppColors.dimWhiteColor),
                        children: [
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
