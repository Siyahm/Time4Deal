import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:time4deal/routes/rout_names.dart';

class SpalashScreenProvider with ChangeNotifier {
  Future<void> goHome(context) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final onboardingScreen = await storage.read(key: 'onboardScreen');
    await Future.delayed(
      const Duration(seconds: 5),
    );

    if (token != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteNames.bottomNavBar, (route) => false);
    } else if (onboardingScreen != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteNames.onboarding, (route) => false);
    }
    // token != null
    //     ? Navigator.of(context)
    //         .pushNamedAndRemoveUntil(RouteNames.bottomNavBar, (route) => false)
    //     : Navigator.of(context)
    //         .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
  }
}
