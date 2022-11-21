import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/utils/custom_toast.dart';

class ProductDetailsContoller with ChangeNotifier {
  // int listIndex = 0;
  int quantity = 1;
  int itemOriginalPrize = 1999;
  int totalPrice = 0;
  int offerPercentage = 50;
  double offerPrice = 0;

  List<String> productImages = [
    'lib/assets/sample 1.png',
    'lib/assets/sample 2.png',
    'lib/assets/sample 3.png',
    'lib/assets/sample 4.png',
  ];
  // List<Color> itemColors = [
  //   AppColors.bgColor,
  //   AppColors.redColor,
  //   AppColors.whiteColor,
  //   AppColors.greyColor,
  // ];

  // void onSelectColor(int index) {
  //   listIndex = index;
  //   notifyListeners();
  // }

  void onPressedPlusButton() {
    if (quantity < 10) {
      quantity++;
    } else {
      customToast(
        'You can buy maximum 100 pcs in a single order',
        AppColors.redColor,
      );
    }
    findTotalPrice();
    notifyListeners();
  }

  void onPressedMinusButton() {
    if (quantity > 1) {
      quantity--;
      findTotalPrice();
      notifyListeners();
    }
  }

  void findTotalPrice() {
    totalPrice = itemOriginalPrize * quantity;
    offerPrice = (totalPrice * offerPercentage / 100) - 1;
    notifyListeners();
  }
}
