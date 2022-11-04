class ForgotPasswordModel {
  String? fullname;
  String? email;
  String? password;
  String? phone;

  ForgotPasswordModel({
    this.fullname,
    this.email,
    this.password,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> jSon) {
    return ForgotPasswordModel(
        fullname: jSon['fullname'],
        email: jSon['email'],
        password: jSon['password'],
        phone: jSon['phone']);
  }
}
