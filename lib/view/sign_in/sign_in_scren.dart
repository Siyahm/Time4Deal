import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/sign_up_controller/sign_up_provider.dart';
import 'package:time4deal/helpers/app_colors.dart';
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
    final signUpProvider = Provider.of<SignUpProvider>(context);
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
                  isObscure: signUpProvider.isObscure,
                  suffixIcon: GestureDetector(
                    child: signUpProvider.isObscure == false
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onTap: () => signUpProvider.setObscure(),
                  ),
                  controller: signInProvider.passwordController,
                  text: 'Password',
                  validation: (String? value) {
                    return CommonValidations.passwordValidation(value);
                  },
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
                Consumer<SignInProvider>(
                  builder: (context, value, child) => LongElevatedButton(
                    onPressed: () {
                      value.onSignIn(signInFormKey, context);
                    },
                    child: value.isLoading == true
                        ? const CircularProgressIndicator()
                        : const Text('SIGN IN'),
                  ),
                ),
                SizedBoxes.heightBox10,
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
                      signInProvider.googleLogin(context);
                      // await GoogleSignIn().signOut();
                    },
                    child: Consumer<SignInProvider>(
                      builder: (context, value, child) => Container(
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Sign In with'),
                            SizedBoxes.widthBox10,
                            value.isLoadingGoogle == true
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                        'lib/assets/google icon.png',
                                      )),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
