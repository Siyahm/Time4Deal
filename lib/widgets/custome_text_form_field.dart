import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.text,
    required this.controller,
    this.validation,
    this.isObscure = false,
    this.suffixIcon,
    this.keyboard,
  }) : super(key: key);
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final bool isObscure;
  final Widget? suffixIcon;
  final TextInputType? keyboard;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      toolbarOptions: const ToolbarOptions(paste: false),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboard,
      obscureText: isObscure,
      validator: validation,
      style: AppTextStyles.textFiledTextStyle,
      cursorColor: AppColors.whiteColor,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor,
          ),
        ),
        fillColor: AppColors.whiteColor.withOpacity(0.13),
        filled: true,
        label: Text(
          text,
          style: AppTextStyles.formFieldLabelTextStyle,
        ),
      ),
    );
  }
}
