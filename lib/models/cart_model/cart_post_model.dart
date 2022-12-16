class CartPostModel {
  CartPostModel({
    required this.productId,
    required this.qty,
    required this.size,
  });
  String productId;
  String qty;
  String size;

  Map<String, dynamic> toJson() => {
        "product": productId,
        "qty": qty,
        "size": size,
      };
}
