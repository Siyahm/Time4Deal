import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:time4deal/models/category_model/category_model.dart';
import 'package:time4deal/service/category_service/category_service.dart';
import 'package:time4deal/view/product_details/product_details_arguments.dart';
import 'package:time4deal/models/carousal_model/carousal_model.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/carousal_service/carousal_service.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    getCarousals();
    getCategories();
  }
  bool isLoading = false;
  bool isCategoryLoding = false;
  List<CarousalModel> carousalItems = [];
  List<CategoryModel> categoriesList = [];

  void addFavourite(int index) {
    trendingProductItems[index].isFavourite =
        !trendingProductItems[index].isFavourite!;
    notifyListeners();
  }

  void onTapCard(BuildContext context, int index, ProductModel? model) {
    ProductDetailsArguments args =
        ProductDetailsArguments(index: index, model: model);
    Navigator.of(context).pushNamed(RouteNames.productDetails, arguments: args);
  }

  // final List<Widget>? featuredProductItems1 = [
  //   // const FeaturedProduct(
  //   //   image: "lib/assets/6.jpg",
  //   // ),
  //   // const FeaturedProduct(
  //   //   image: "lib/assets/9.jpg",
  //   // ),
  //   // const FeaturedProduct(
  //   //   image: "lib/assets/1.jpg",
  //   // ),
  // ];
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

  final List<ProductModel> trendingProductItems = [
    ProductModel(
        image: ['lib/assets/watch pic 1.png'],
        company: 'FOSSIL',
        name: 'GRAND WATCH',
        price: "500",
        // color: Colors.black,
        category: 'Men',
        strap: 'Silicon',
        warrenty: '1 year',
        description: '',
        isFavourite: false),
    ProductModel(
        image: ['lib/assets/watch pic 2.png'],
        company: 'TOMMY HILFIGER',
        name: 'DUCKER WATCH',
        price: '499',
        // color: Colors.blue,
        category: 'Men',
        strap: 'Silicon',
        warrenty: '1 year',
        description: '',
        isFavourite: false),
    ProductModel(
        image: ['lib/assets/watch pic 3.png'],
        company: 'TOMMY HILFIGER',
        name: 'DUCKER WATCH',
        price: '499',
        // color: Colors.red,
        category: 'Men',
        strap: 'Silicon',
        warrenty: '1 year',
        description: '',
        isFavourite: false),
    ProductModel(
        image: ['lib/assets/watch pic 4.png'],
        company: 'TOMMY HILFIGER',
        name: 'DUCKER WATCH',
        price: '499',
        // color: Colors.grey,
        category: 'Women',
        strap: 'Silicon',
        warrenty: '1 year',
        description: '',
        isFavourite: false),
  ];

  void getCategories() async {
    isCategoryLoding = true;
    await CategoryService().getCategories().then((value) {
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
}
