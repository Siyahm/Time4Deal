import 'package:flutter/cupertino.dart';
import 'package:time4deal/service/otp_service/otp_service.dart';

class OtpProvider with ChangeNotifier {
  void sendOtp(phone) {
    OtpServices().sendOtp(phone);
  }
}
