class ProductModel {
  String? image;
  String? company;
  String? name;
  String? price;
  String? color;
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
    required this.category,
    required this.isFavourite,
    required this.strap,
    required this.warrenty,
    this.description,
  });
}
