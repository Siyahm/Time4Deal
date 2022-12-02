import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/address_model/address_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/utils/payment_enum.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class StepperController with ChangeNotifier {
  int currentIndex = 0;
  int currentRadio = 0;
  PaymentEnum currentEnum = PaymentEnum.cashOnDelivery;
  List<AddressModel> addressList = [];
  List<String> stepperContinueButtonLabel = [
    'Deliver Here',
    'Confirm Buy',
    'Proceed to Pay'
  ];

  final Razorpay razorPay = Razorpay();

  Map<String, dynamic> options = {
    'key': 'rzp_test_WCftV63OCm1NF3',
    'amount': 50000,
    'name': 'Time4Deal',
    'description': 'Sports Watch',
    'prefill': {'contact': '9656091791', 'email': 'dev.siyaudheen@gmail.com'}
  };

  void onStepContinue(BuildContext context) {
    if (currentIndex < 2) {
      currentIndex += 1;
      notifyListeners();
    } else {
      if (currentEnum == PaymentEnum.cashOnDelivery) {
        Navigator.of(context).pushNamed(RouteNames.myOrders);
      }
    }
  }

  void onStepCancel() {
    if (currentIndex > 0) {
      currentIndex -= 1;
    }
    notifyListeners();
  }

  void onStepTap(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void changeRadio(int index) {
    currentRadio = index;
    notifyListeners();
  }

  void removeAddress(int index) {
    addressList.removeAt(index);
    notifyListeners();
  }

  void onClickAddAddress(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.addAddressScreen);
  }

  void selectPayment(PaymentEnum newValue) {
    currentEnum = newValue;
    notifyListeners();
  }

  void razorPayEvents() {
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

  void openRazorPay() {
    razorPay.open(options);
  }

  void clearRazorPayListener() {
    razorPay.clear();
    notifyListeners();
  }
}
