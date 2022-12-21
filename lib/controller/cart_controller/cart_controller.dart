import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/cart_model/cart_get_model.dart';
import 'package:time4deal/models/cart_model/cart_post_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/cart_service/cart_service.dart';
import 'package:time4deal/utils/custom_toast.dart';

class CartController with ChangeNotifier {
  bool isLoading = false;
  List<CartProductModel> cartList = [];
  List<String?> cartItemsIds = [];
  final int quantity = 1;

  Future<void> addToCart(CartPostModel cartPostModel) async {
    isLoading = true;
    notifyListeners();

    await CartService().addToCart(cartPostModel).then((value) {
      if (value != null) {
        isLoading = false;
        notifyListeners();

        if (!cartItemsIds.contains(cartPostModel.productId)) {
          customToast('Item added to cart', AppColors.greenColor);
        }
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void goToCart(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.myCart);
  }

  Future<void> getCartItems() async {
    isLoading = true;
    notifyListeners();
    await CartService().getCartItems().then((value) {
      if (value != null) {
        cartList = value.products.map((e) => e.cartProduct).toList();
        cartItemsIds = value.products.map((e) => e.cartProduct.id).toList();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  Future<void> remomeCartItem(String itemId) async {
    log('remove called');
    isLoading = true;
    notifyListeners();
    log('reached here');
    await CartService().removeCartItem(itemId).then((value) {
      log('removeService called');
      if (value != null) {
        customToast(value, AppColors.greenColor);
      }
    });
    isLoading == false;
    notifyListeners();
  }
}
