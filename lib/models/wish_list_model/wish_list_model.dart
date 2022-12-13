class WishListModel {
  WishListModel({
    required this.id,
    required this.userId,
    required this.products,
    required this.v,
  });

  String id;
  String userId;
  List<ProductElement> products;
  int v;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        id: json["_id"],
        userId: json["userId"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        v: json["__v"],
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "userId": userId,
  //       "products": List<dynamic>.from(products.map((x) => x.toJson())),
  //       "__v": v,
  //     };
}

class ProductElement {
  ProductElement({
    required this.product,
    required this.id,
  });

  ProductDetailsModel product;
  String id;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductDetailsModel.fromJson(json["product"]),
        id: json["_id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "product": product.toJson(),
  //       "_id": id,
  //     };
}

class ProductDetailsModel {
  ProductDetailsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.offer,
    required this.rating,
    required this.size,
    required this.image,
    required this.category,
    required this.v,
  });

  String id;
  String name;
  int price;
  int discountPrice;
  int offer;
  String rating;
  List<String> size;
  List<String> image;
  String category;
  int v;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        offer: json["offer"],
        rating: json["rating"],
        size: List<String>.from(json["size"].map((x) => x)),
        image: List<String>.from(json["image"].map((x) => x)),
        category: json["category"],
        v: json["__v"],
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "name": name,
  //       "price": price,
  //       "discountPrice": discountPrice,
  //       "offer": offer,
  //       "rating": rating,
  //       "size": List<dynamic>.from(size.map((x) => x)),
  //       "image": List<dynamic>.from(image.map((x) => x)),
  //       "category": category,
  //       "__v": v,
  //     };
}
