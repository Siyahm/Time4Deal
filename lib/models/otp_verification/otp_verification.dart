class OtpVerificationModel {
  String? otp;
  String? phone;

  OtpVerificationModel({
    required this.otp,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'otp': otp,
    };
  }
}
