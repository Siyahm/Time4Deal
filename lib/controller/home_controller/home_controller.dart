import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:time4deal/models/category_model/category_model.dart';
import 'package:time4deal/service/category_service/category_service.dart';
import 'package:time4deal/service/products_view_screen_service/product_view_screen_service.dart';
import 'package:time4deal/view/product_details/product_details_arguments.dart';
import 'package:time4deal/models/carousal_model/carousal_model.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/carousal_service/carousal_service.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    getAllPorducts();
    getCarousals();
    getCategories();
  }
  bool isLoading = false;
  bool isCategoryLoding = false;
  bool isProductstsLoading = false;
  List<CarousalModel> carousalItems = [];
  List<CategoryModel> categoriesList = [];
  List<ProductModel> allProducts = [];

  void addFavourite(int index) {
    notifyListeners();
  }

  void onTapCard(BuildContext context, int index, ProductModel? model) {
    ProductDetailsArguments args =
        ProductDetailsArguments(index: index, model: model);
    Navigator.of(context).pushNamed(RouteNames.productDetails, arguments: args);
  }

  void getCarousals() async {
    isLoading = true;
    notifyListeners();
    await GetCarousalService().getCarousal().then((value) {
      if (value != null) {
        carousalItems = value;
        log('not null');
      }
    });
    isLoading = false;
    notifyListeners();
  }

  List<ProductModel> trendingProductItems = [];

  void getCategories() async {
    isCategoryLoding = true;
    CategoryService().getCategories().then((value) {
      if (value != null) {
        categoriesList = value;
        notifyListeners();
        log(categoriesList.toString());
      } else {
        log('value is null');
      }
    });
    isCategoryLoding = false;
    notifyListeners();
  }

  void getAllPorducts() async {
    isProductstsLoading = true;
    notifyListeners();
    ProductViewScreenService().getProduct().then((value) {
      if (value != null) {
        trendingProductItems = value;
        isProductstsLoading = false;
        notifyListeners();
      }
    });
    isProductstsLoading = false;
    notifyListeners();
  }
}
