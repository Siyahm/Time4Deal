class OtpVerificationModel {
  String? otp;
  String? email;

  OtpVerificationModel({
    required this.otp,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }
}
