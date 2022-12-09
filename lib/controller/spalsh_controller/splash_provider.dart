import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:time4deal/routes/rout_names.dart';

class SpalashScreenProvider with ChangeNotifier {
  Future<void> goHome(context) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    await Future.delayed(
      const Duration(seconds: 5),
    );
    token != null
        ? Navigator.of(context).pushNamed(RouteNames.bottomNavBar)
        : Navigator.of(context).pushNamed(RouteNames.signInScreen);
  }
}
