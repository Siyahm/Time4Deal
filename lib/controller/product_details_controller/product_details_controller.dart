import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/service/product_details_service/product_details_screen_sevice.dart';
import 'package:time4deal/utils/custom_toast.dart';

import '../../routes/rout_names.dart';

class ProductDetailsContoller with ChangeNotifier {
  bool isLoading = false;
  ProductModel? product;

  // int listIndex = 0;
  int quantity = 1;
  int itemOriginalPrize = 0;
  int totalPrice = 0;
  int offerPercentage = 0;
  double offerPrice = 0;

  // List<String> productImages = [
  //   'lib/assets/sample 1.png',
  //   'lib/assets/sample 2.png',
  //   'lib/assets/sample 3.png',
  //   'lib/assets/sample 4.png',
  // ];
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
    itemOriginalPrize = product!.price;
    offerPercentage = product!.offer;
    totalPrice = itemOriginalPrize * quantity;
    offerPrice = totalPrice - (totalPrice * offerPercentage / 100) - 1;
    notifyListeners();
  }

  Future<void> getAProduct(String productId, BuildContext context) async {
    log(productId.toString());
    isLoading = true;
    notifyListeners();
    await ProductDetailsScreenService().getAProduct(productId).then((value) {
      log('product value$value');
      if (value != null) {
        product = value;
        Navigator.of(context).pushNamed(RouteNames.productDetails);
        notifyListeners();
      } else {
        log('hey this value is null');
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void goToStepperScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.stepperScreens);
  }
}
