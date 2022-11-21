import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';

class AppTextStyles {
  static const mainTitle = TextStyle(
      fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.themeColor);
  static const mainTitleWhite = TextStyle(
      fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static const mainTitleRed = TextStyle(
      fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.redColor);
  static const subTitle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static const subTitleRed = TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.redColor);
  static const head1 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static const head1blsck =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  static final formFieldLabelTextStyle =
      TextStyle(color: AppColors.whiteColor.withOpacity(0.4));
  static const textFiledTextStyle = TextStyle(fontSize: 18);
  static const butonTextStyle =
      TextStyle(color: Color.fromARGB(255, 0, 132, 255), fontSize: 16);
  static const normalText = TextStyle(fontSize: 16);
  static const normalTextBold =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const normalTextBlack = TextStyle(fontSize: 16, color: Colors.black);
  static const normalTextYellow =
      TextStyle(fontSize: 16, color: AppColors.whiteColor);
  static const buttonTextBlack = TextStyle(color: Colors.black);
  static const buttonTextYellow = TextStyle(color: AppColors.themeColor);
  static const textButtonStyle = TextStyle(color: AppColors.themeColor);
}
