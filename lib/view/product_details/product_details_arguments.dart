import 'package:time4deal/models/product_model/product_model.dart';

class ProductDetailsArguments {
  final int index;
  final String? productId;
  final ProductModel? model;

  ProductDetailsArguments({
    required this.index,
    required this.productId,
    required this.model,
  });
}
