import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/address_model/address_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/payment_service/payment_service.dart';
import 'package:time4deal/utils/payment_enum.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class StepperController with ChangeNotifier {
  late Razorpay razorPay;
  int currentIndex = 0;
  int currentRadio = 0;
  PaymentEnum currentEnum = PaymentEnum.cashOnDelivery;
  List<AddressModel> addressList = [];
  List<String> stepperContinueButtonLabel = [
    'Deliver Here',
    'Confirm Buy',
    'Proceed to Pay'
  ];

  void onStepContinue(BuildContext context) {
    if (currentIndex < 2) {
      currentIndex += 1;
      notifyListeners();
    } else {
      if (currentEnum == PaymentEnum.cashOnDelivery) {
        Navigator.of(context).pushNamed(RouteNames.myOrders);
      } else if (currentEnum == PaymentEnum.onlinePayment) {
        // log('online payment');
        PaymentService().openRazorPay(razorPay);
        // razorPayEvents();
      }
    }
  }

  void razorPayInit() {
    PaymentService().razorPayEvents(razorPay);
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
}
