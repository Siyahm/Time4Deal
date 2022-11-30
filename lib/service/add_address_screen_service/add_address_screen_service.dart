import 'dart:developer';

import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/utils/custom_toast.dart';

class AddAddressScreenservice {
  Future<Position?> getPosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        log('serviceEnabled is false');
        customToast('Location is not turned ON ', AppColors.redColor);
      } else {
        log('seviceEnabled is true');
        permission = await Geolocator.checkPermission();
        log('entered try');
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            customToast('Location permission denied', AppColors.redColor);
            return null;
          }
        } else if (permission == LocationPermission.deniedForever) {
          customToast(
              'Location permission is permenantly denied, Please change your device settings',
              AppColors.redColor);
          return null;
        } else {
          Position position = await Geolocator.getCurrentPosition();
          return position;
        }
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<Address?> getCordinates(double latitude, double longitude) async {
    try {
      Address address = await GeoCode()
          .reverseGeocoding(latitude: latitude, longitude: longitude);
      return address;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
