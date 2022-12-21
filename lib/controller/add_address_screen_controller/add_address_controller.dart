import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geocode/geocode.dart';
import 'package:time4deal/models/address_model/address_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/add_address_screen_service/add_address_screen_service.dart';

class AddAddressController with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();

  final TextEditingController mobController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  AddressTitle addressTitle = AddressTitle.home;

  bool isLoading = false;
  double latitude = 0.0;
  double longitude = 0.0;
  Address? currentAddress;

  void changeRadioValue(AddressTitle newValue) {
    addressTitle = newValue;
    notifyListeners();
  }

  void onClickSaveButton(List<AddressModel> addressList, BuildContext context,
      GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      final address = AddressModel(
          name: nameController.text,
          address: addressController.text,
          landMark: landmarkController.text,
          pinCode: pincodeController.text,
          place: placeController.text,
          state: stateController.text,
          mobNum: mobController.text);
      addressList.add(address);
      notifyListeners();
      clearControllers();
      Navigator.of(context).pushNamed(RouteNames.stepperScreens);
    }
  }

  void clearControllers() {
    nameController.clear();
    addressController.clear();
    landmarkController.clear();
    pincodeController.clear();
    placeController.clear();
    stateController.clear();
    mobController.clear();
  }

  void getCurrentLocation() async {
    isLoading = true;
    notifyListeners();
    await AddAddressScreenservice().getPosition().then((value) async {
      if (value != null) {
        latitude = value.latitude;
        longitude = value.longitude;
        // log(value.toString());

        getCurrentAddress();
      } else {
        // log('value is null');
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void getCurrentAddress() async {
    isLoading = true;
    notifyListeners();
    await AddAddressScreenservice()
        .getCordinates(latitude, longitude)
        .then((value) {
      if (value != null) {
        currentAddress = value;
        fillCurrentAddress();
        // log(currentAddress!.streetAddress.toString());
        notifyListeners();
      } else {
        log('value is null;');
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void fillCurrentAddress() {
    addressController.text = currentAddress!.streetAddress!;
    pincodeController.text = currentAddress!.postal!;
    stateController.text = currentAddress!.region!;
    placeController.text = currentAddress!.city!;

    notifyListeners();
  }
}

enum AddressTitle { home, office }
