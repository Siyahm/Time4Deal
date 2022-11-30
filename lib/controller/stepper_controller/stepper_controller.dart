import 'package:flutter/cupertino.dart';
import 'package:time4deal/models/address_model/address_model.dart';
import 'package:time4deal/routes/rout_names.dart';

class StepperController with ChangeNotifier {
  int currentIndex = 0;

  List<AddressModel> addressList = [
    // AddressModel(
    //     name: "Siyah Musliyarakath",
    //     address: 'Parasseri',
    //     landMark: 'Arimanal',
    //     pinCode: '676525',
    //     mobNum: '9656091791'),
    // AddressModel(
    //     name: "Siyah",
    //     address: 'Parasseri',
    //     landMark: 'Arimanal',
    //     pinCode: '676525',
    //     mobNum: '9656091791'),
    // AddressModel(
    //     name: "Siyah",
    //     address: 'Parasseri',
    //     landMark: 'Arimanal',
    //     pinCode: '676525',
    //     mobNum: '9656091791'),
    // AddressModel(
    //     name: "Siyah Musliyarakath",
    //     address: 'Parasseri',
    //     landMark: 'Arimanal',
    //     pinCode: '676525',
    //     mobNum: '9656091791'),
    // AddressModel(
    //     name: "Siyah",
    //     address: 'Parasseri',
    //     landMark: 'Arimanal',
    //     pinCode: '676525',
    //     mobNum: '9656091791'),
    // AddressModel(
    //     name: "Siyah",
    //     address: 'Parasseri',
    //     landMark: 'Arimanal',
    //     pinCode: '676525',
    //     mobNum: '9656091791'),
  ];

  void onStepContinue() {
    if (currentIndex < 2) {
      currentIndex += 1;
      notifyListeners();
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

  int currentRadio = 0;

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
}
