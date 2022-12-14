import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/wish_list_model/wish_list_model.dart';
import 'package:time4deal/service/wish_list_services/wish_list_services.dart';

class WishListController extends ChangeNotifier {
  WishListController() {
    getWishList();
  }

  bool isLoading = true;
  List<ProductDetailsModel> wishListItemList = [];
  List<String?> wishListProductIds = [];

  Future<String?> addOrRemoveWishListItem(String productId) async {
    isLoading == true;
    notifyListeners();

    await WishListServices().addToWishList(productId).then((value) {
      if (value != null) {
        isLoading == false;
        notifyListeners();
        return value;
      } else {
        isLoading == false;
        notifyListeners();
        return value;
      }
    });
    // log(successMessage.toString());
    return null;
  }

  void getWishList() async {
    log('getwishlist called');
    isLoading = true;
    notifyListeners();

    await WishListServices().getWishList().then((value) {
      if (value != null) {
        log('wishlist not null');
        wishListItemList.clear();
        wishListItemList = value.products.map((e) {
          return e.product;
        }).toList();
        wishListProductIds = wishListItemList.map((e) {
          return e.id;
        }).toList();
        log(wishListItemList.toString());
      }
    });
    isLoading = false;
    notifyListeners();
    return null;
  }
}
