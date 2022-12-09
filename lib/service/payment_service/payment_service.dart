import 'dart:developer';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  void razorPayEvents(Razorpay razorPay) {
    // log('Razorpay called');
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Payment Success');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    log('Payment faild');
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  void openRazorPay(Razorpay razorPay) {
    Map<String, dynamic> options = {
      'key': 'rzp_test_WCftV63OCm1NF3',
      'amount': 50000,
      'name': 'Time4Deal',
      'description': 'Sports Watch',
      'prefill': {'contact': '9656091791', 'email': 'dev.siyaudheen@gmail.com'}
    };
    razorPay.open(options);
  }
}
