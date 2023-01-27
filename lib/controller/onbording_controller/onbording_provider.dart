import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OnbordingProvider with ChangeNotifier {
  final PageController onbordingController = PageController();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  void completedOnboardingScreens() async {
    await storage.write(key: 'onboardScreen', value: 'Completed');
    log(storage.read(key: 'onboardScreen').toString());
  }
}
