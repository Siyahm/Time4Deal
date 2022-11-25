import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/product_model/product_model.dart';

class WishListController with ChangeNotifier {
  List<ProductModel> wishListItemList = [];

  void addToWishList(ProductModel model) {
    // if (model.isFavourite == true) {
    wishListItemList.add(model);
    notifyListeners();
    // }
  }

  void removeFromWishList(ProductModel model) {
    wishListItemList.remove(model);
    notifyListeners();
  }
}
