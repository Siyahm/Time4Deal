class UserModel {
  String? id;
  String? fullnaem;
  String? email;
  String? password;
  String? phone;

  UserModel({
    required this.id,
    required this.fullnaem,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"],
      fullnaem: json["fullname"],
      email: json["email"],
      password: json["password"],
      phone: json["phone"],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'email': email,
  //     'password': password,
  //   };
  // }
}
