import 'package:flutter/cupertino.dart';

class SignInProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onSignUpButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed('signUpScreen');
  }

  void onForgotButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed('forgotPasswordScreen');
  }
}
