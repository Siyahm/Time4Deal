import 'package:time4deal/models/product_model/product_model.dart';

class ProductDetailsArguments {
  final int index;
  final ProductModel? model;

  ProductDetailsArguments({
    required this.index,
    required this.model,
  });
}
