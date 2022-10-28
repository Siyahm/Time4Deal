import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.text,
    required this.controller,
    required this.validation,
  }) : super(key: key);
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      style: AppTextStyles.textFiledTextStyle,
      cursorColor: AppColors.whiteColor,
      controller: controller,
      decoration: InputDecoration(
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
