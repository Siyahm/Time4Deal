class CarousalModel {
  String? image;
  String? offer;

  CarousalModel({
    required this.image,
    required this.offer,
  });

  factory CarousalModel.fromJson(Map<String, dynamic> json) {
    return CarousalModel(
      image: json['image'],
      offer: json['offer'],
    );
  }
}
