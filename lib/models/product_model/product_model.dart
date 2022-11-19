import 'package:flutter/animation.dart';

class ProductModel {
  String? image;
  String? company;
  String? name;
  String? price;
  Color? color;
  Color? color2;
  Color? color3;
  String? category;
  String? strap;
  String? warrenty;
  String? description;
  bool? isFavourite;

  ProductModel({
    required this.image,
    required this.company,
    required this.name,
    required this.price,
    required this.color,
    this.color2,
    this.color3,
    required this.category,
    required this.isFavourite,
    required this.strap,
    required this.warrenty,
    this.description,
  });
}
