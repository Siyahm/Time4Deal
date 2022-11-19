import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';

class ProductDetailsContoller with ChangeNotifier {
  int listIndex = 0;

  List<String> productImages = [
    'lib/assets/sample 1.png',
    'lib/assets/sample 2.png',
    'lib/assets/sample 3.png',
    'lib/assets/sample 4.png',
  ];
  List<Color> itemColors = [
    AppColors.bgColor,
    AppColors.redColor,
    AppColors.whiteColor,
    AppColors.greyColor,
  ];

  void onSelectColor(int index) {
    listIndex = index;
    notifyListeners();
  }
}
