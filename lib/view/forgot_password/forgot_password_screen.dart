import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/forgot_password_controller/forgot_password_provider.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/utils/common_validations.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/custome_text_form_field.dart';
import 'package:time4deal/widgets/long_elevated_button.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final forgotProvider = Provider.of<ForgotPasswordProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const CustomAppBarLeadingWidget(),
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
                style: AppTextStyles.mainTitleDimWhite,
              ),
              SizedBoxes.heightBox50,
              const Text(
                'Please enter your registered email address',
                style: AppTextStyles.normalText,
                textAlign: TextAlign.justify,
              ),
              SizedBoxes.heightBox20,
              Form(
                key: formKey,
                child: CustomTextFormField(
                  controller: forgotProvider.emailFieldControl,
                  text: 'Email',
                  validation: (String? value) {
                    return CommonValidations.emailValidation(value);
                  },
                ),
              ),
              SizedBoxes.heightBox30,
              Consumer<ForgotPasswordProvider>(
                builder: (context, value, child) => LongElevatedButton(
                  color: AppColors.dimWhiteColor,
                  onPressed: () {
                    value.onSendButtonPressed(formKey, context);
                  },
                  child: value.isLoading == true
                      ? const CircularProgressIndicator()
                      : const Text(
                          'SEND',
                          style: AppTextStyles.buttonTextBlack,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
