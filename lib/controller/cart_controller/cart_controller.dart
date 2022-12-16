import 'package:flutter/cupertino.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/cart_model/cart_get_model.dart';
import 'package:time4deal/models/cart_model/cart_post_model.dart';
import 'package:time4deal/service/cart_service/cart_service.dart';
import 'package:time4deal/utils/custom_toast.dart';

class CartController with ChangeNotifier {
  bool isLoading = false;
  List<CartProductModel> cartList = [];
  final int quantity = 1;

  Future<void> addToCart(CartPostModel cartPostModel) async {
    isLoading = true;
    notifyListeners();

    await CartService().addToCart(cartPostModel).then((value) {
      if (value != null) {
        isLoading = false;
        notifyListeners();
        customToast('Item added to cart', AppColors.greenColor);
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  Future<void> getCartItems() async {
    isLoading = true;
    notifyListeners();
    await CartService().getCartItems().then((value) {
      if (value != null) {
        cartList = value.products.map((e) => e.cartProduct).toList();
      }
    });
    isLoading = false;
    notifyListeners();
  }
}
