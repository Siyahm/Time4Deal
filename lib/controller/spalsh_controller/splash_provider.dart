import 'package:flutter/cupertino.dart';
import 'package:time4deal/routes/rout_names.dart';

class SpalashScreenProvider with ChangeNotifier {
  Future<void> goHome(context) async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Navigator.of(context).pushNamed(RouteNames.signInScreen);
  }
}
