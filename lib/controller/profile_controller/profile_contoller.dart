import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:time4deal/routes/rout_names.dart';

class ProfileController with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void logOut(BuildContext context) {
    log('logout called');
    storage.deleteAll();
    notifyListeners();
    Navigator.of(context).pushNamed(RouteNames.signInScreen);
  }
}
