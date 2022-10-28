import 'dart:developer';

import 'package:flutter/cupertino.dart';

class ForgotPasswordProvider with ChangeNotifier {
  final TextEditingController emailFieldControl = TextEditingController();

  void onSendButtonPressed(GlobalKey<FormState> formKey, BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'otpVerificationScreen');
      log('send message');
    }
  }
}
