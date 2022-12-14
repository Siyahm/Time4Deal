// import 'dart:convert';

// CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

// String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.id,
    required this.userid,
    required this.products,
    required this.totalPrice,
    required this.totalDiscount,
    required this.v,
  });

  String id;
  String userid;
  List<ProductElement> products;
  int totalPrice;
  int totalDiscount;
  int v;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["_id"],
        userid: json["userid"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        totalPrice: json["totalPrice"],
        totalDiscount: json["totalDiscount"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userid": userid,
        "totalPrice": totalPrice,
        "totalDiscount": totalDiscount,
        "__v": v,
      };
}

class ProductElement {
  ProductElement({
    required this.product,
    required this.size,
    required this.qty,
    required this.price,
    required this.discountPrice,
    required this.id,
  });

  ProductModel product;
  String size;
  int qty;
  int price;
  int discountPrice;
  String id;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductModel.fromJson(json["product"]),
        size: json["size"],
        qty: json["qty"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": id,
        "size": size,
        "qty": qty,
      };
}

class ProductModel {
  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "discountPrice": discountPrice,
        "offer": offer,
        "rating": rating,
        "size": List<dynamic>.from(size.map((x) => x)),
        "image": List<dynamic>.from(image.map((x) => x)),
        "category": category,
        "__v": v,
      };
}
