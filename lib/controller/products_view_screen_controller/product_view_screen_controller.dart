import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/service/products_view_screen_service/product_view_screen_service.dart';

class ProductViewScreenController with ChangeNotifier {
  bool isLoading = false;

  List<ProductModel> categoryProducts = [];

  void getCategoryProducts(String categoryId) async {
    isLoading = true;
    notifyListeners();
    ProductViewScreenService().getCategoryProduct(categoryId).then((value) {
      // log(value.toString());
      if (value != null) {
        categoryProducts = value;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
    return null;
  }
}
