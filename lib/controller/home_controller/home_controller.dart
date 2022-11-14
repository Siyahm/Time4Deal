import 'package:flutter/material.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/view/home/widget/featured_products.dart';

class HomeController with ChangeNotifier {
  void addFavourite(int index) {
    trendingProductItems[index].isFavourite =
        !trendingProductItems[index].isFavourite!;
    notifyListeners();
  }

  final List<Widget>? featuredProductItems = [
    const FeaturedProduct(
      image: "lib/assets/6.jpg",
    ),
    const FeaturedProduct(
      image: "lib/assets/9.jpg",
    ),
    const FeaturedProduct(
      image: "lib/assets/1.jpg",
    ),
  ];
  final List<ProductModel> trendingProductItems = [
    ProductModel(
        image: 'lib/assets/watch pic 1.png',
        company: 'FOSSIL',
        name: 'GRAND WATCH',
        price: "500",
        color: 'Black',
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
        color: 'Blue',
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
        color: 'Red',
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
        color: 'Black',
        category: 'Women',
        strap: 'Silicon',
        warrenty: '1 year',
        description: '',
        isFavourite: false),
  ];
}
