import 'package:flutter/material.dart';
import 'package:time4deal/view/home/widget/featured_products.dart';
import 'package:time4deal/view/home/widget/trending_products.dart';

class HomeController with ChangeNotifier {
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
  final List trendingProductItems = [
    const TrendingProduct(
      image: 'lib/assets/watch pic 1.png',
      company: 'FOSSIL',
      watchName: 'GRAND WATCH',
    ),
    const TrendingProduct(
      company: 'TOMMY HILFIGER',
      watchName: 'DUCKER WATCH',
      image: 'lib/assets/watch pic 2.png',
    ),
    const TrendingProduct(
      company: 'TOMMY HILFIGER',
      watchName: 'DUCKER WATCH',
      image: 'lib/assets/watch pic 3.png',
    ),
    const TrendingProduct(
      company: 'FOSSIL',
      watchName: 'GRAND WATCH',
      image: 'lib/assets/watch pic 4.png',
    ),
  ];
}
