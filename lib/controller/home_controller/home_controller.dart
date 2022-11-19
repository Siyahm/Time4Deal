import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:time4deal/models/carousal_model/carousal_model.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/service/carousal_service/carousal_service.dart';
import 'package:time4deal/view/home/widget/featured_products.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    getCarousals();
  }
  List<CarousalModel> carousalItems = [];

  void addFavourite(int index) {
    trendingProductItems[index].isFavourite =
        !trendingProductItems[index].isFavourite!;
    notifyListeners();
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
    await GetCarousalService().getCarousal().then((value) {
      if (value != null) {
        carousalItems = value;
        log('not null');
      }
    });
    notifyListeners();
  }

  final List<ProductModel> trendingProductItems = [
    ProductModel(
        image: 'lib/assets/watch pic 1.png',
        company: 'FOSSIL',
        name: 'GRAND WATCH',
        price: "500",
        color: Colors.black,
        category: 'Men',
        strap: 'Silicon',
        warrenty: '1 year',
        description: '',
        isFavourite: false),
    ProductModel(
        image: 'lib/assets/watch pic 2.png',
        company: 'TOMMY HILFIGER',
        name: 'DUCKER WATCH',
        price: '499',
        color: Colors.blue,
        category: 'Men',
        strap: 'Silicon',
        warrenty: '1 year',
        description: '',
        isFavourite: false),
    ProductModel(
        image: 'lib/assets/watch pic 3.png',
        company: 'TOMMY HILFIGER',
        name: 'DUCKER WATCH',
        price: '499',
        color: Colors.red,
        category: 'Men',
        strap: 'Silicon',
        warrenty: '1 year',
        description: '',
        isFavourite: false),
    ProductModel(
        image: 'lib/assets/watch pic 4.png',
        company: 'TOMMY HILFIGER',
        name: 'DUCKER WATCH',
        price: '499',
        color: Colors.grey,
        category: 'Women',
        strap: 'Silicon',
        warrenty: '1 year',
        description: '',
        isFavourite: false),
  ];
}