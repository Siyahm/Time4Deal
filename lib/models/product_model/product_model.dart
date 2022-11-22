import 'package:flutter/animation.dart';

class ProductModel {
  String? company;
  String? name;
  String? price;
  String? discountPrice;
  String? offer;
  // Color? color;
  // Color? color2;
  // Color? color3;
  String? category;
  String? strap;
  List<String>? size;
  List<String>? image;
  String? warrenty;
  String? description;
  bool? isFavourite;

  ProductModel({
    this.company,
    required this.name,
    required this.price,
    this.discountPrice,
    this.offer,
    // this.color,
    // this.color2,
    // this.color3,
    this.category,
    this.isFavourite,
    this.strap,
    this.size,
    required this.image,
    this.warrenty,
    this.description,
  });

  factory ProductModel.frojJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      image: json['image'],
      discountPrice: json['discountPrice'],
      offer: json['offer'],
      size: json['size'],
    );
  }
}
