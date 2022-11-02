import 'package:flutter/material.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/view/forgot_password/forgot_password_screen.dart';
import 'package:time4deal/view/home/home.dart';
import 'package:time4deal/view/otp_screen/otp_arguments.dart';
import 'package:time4deal/view/otp_screen/otp_screen.dart';
import 'package:time4deal/view/sign_in/sign_in_scren.dart';
import 'package:time4deal/view/sign_up/sign_up_screen.dart';
import 'package:time4deal/view/splash_screen/splash_screen.dart';

class AppRouts {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case RoutNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case RoutNames.signInScreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
        );
      case RoutNames.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => ForgotPassword(),
        );
      case RoutNames.otpVerificationScreen:
        final arg = settings.arguments as OtpArguments;

        return MaterialPageRoute(
          builder: (context) => OtpScreen(signUpModel: arg.signUpModel),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
