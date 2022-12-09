// class ProductModel {
//   ProductModel({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.discountPrice,
//     required this.offer,
//     required this.rating,
//     required this.size,
//     required this.image,
//     required this.category,
//   });

//   String id;
//   String name;
//   String price;
//   String discountPrice;
//   String offer;
//   String rating;
//   List<String> size;
//   List<String> image;
//   String category;

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json["_id"],
//         name: json["name"],
//         price: json["price"],
//         discountPrice: json["discountPrice"],
//         offer: json["offer"],
//         rating: json["rating"],
//         size: List<String>.from(json["size"].map((x) => x)),
//         image: List<String>.from(json["image"].map((x) => x)),
//         category: json["category"],
//       );
// }
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
  //     };
}
