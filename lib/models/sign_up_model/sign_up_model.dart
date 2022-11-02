class SignUpModel {
  String? fullname;
  String? email;
  String? password;
  String? phone;

  SignUpModel({
    required this.fullname,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }

  factory SignUpModel.fomJson(Map<String, dynamic> json) {
    return SignUpModel(
        fullname: json['fullname'],
        email: json['email'],
        password: json['password'],
        phone: json['phone']);
  }
}
