import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geocode/geocode.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/address_model/address_model.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/add_address_screen_service/add_address_screen_service.dart';
import 'package:time4deal/utils/custom_toast.dart';

class AddAddressController with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();

  final TextEditingController mobController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  AddressTitle addressTitle = AddressTitle.home;
  AddressModel? addressModel;

  bool isLoading = false;
  double latitude = 0.0;
  double longitude = 0.0;
  Address? currentAddress;

  void changeRadioValue(AddressTitle newValue) {
    addressTitle = newValue;
    notifyListeners();
  }

  void onClickSaveButton(BuildContext context, GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      addressModel = AddressModel(
          title: addressTitle == AddressTitle.home ? 'Home' : 'Office',
          name: nameController.text,
          address: addressController.text,
          landMark: landmarkController.text,
          pinCode: pincodeController.text,
          place: placeController.text,
          state: stateController.text,
          mobNum: mobController.text);

      notifyListeners();
      addAddress().then((value) {
        clearControllers();
        Navigator.of(context).pushNamed(RouteNames.stepperScreens);
      });
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
    landmarkController.text = currentAddress!.city!;

    notifyListeners();
  }

  Future<void> addAddress() async {
    isLoading = true;
    notifyListeners();
    await AddAddressScreenservice().addAddress(addressModel!).then((value) {
      if (value != null) {
        customToast(value, AppColors.greenColor);
      } else {
        log('value is null');
        isLoading == false;
        notifyListeners();
      }
    });
    isLoading == false;
    notifyListeners();
  }
}

enum AddressTitle { home, office }
