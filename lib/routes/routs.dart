import 'package:flutter/material.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/view/add_address_screen/add_address_screen.dart';
import 'package:time4deal/view/cart/my_cart.dart';
import 'package:time4deal/view/category_products_view_screen/category_product_view_screen.dart';
import 'package:time4deal/view/category_products_view_screen/category_product_view_screen_args.dart';
import 'package:time4deal/view/forgot_password/forgot_password_screen.dart';
import 'package:time4deal/view/home/home.dart';
import 'package:time4deal/view/new_password/new_password_screen.dart';
import 'package:time4deal/view/on_boarding/on_bording_screen.dart';
import 'package:time4deal/view/orders/my_orders.dart';
import 'package:time4deal/view/otp_screen/otp_arguments.dart';
import 'package:time4deal/view/otp_screen/otp_screen.dart';
import 'package:time4deal/view/product_details/product_details.dart';
import 'package:time4deal/view/sign_in/sign_in_scren.dart';
import 'package:time4deal/view/sign_up/sign_up_screen.dart';
import 'package:time4deal/view/splash_screen/splash_screen.dart';
import 'package:time4deal/view/stepper/stepper_screen.dart';
import 'package:time4deal/widgets/bottom_nav_bar.dart';

class AppRouts {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case RouteNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case RouteNames.signInScreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
        );
      case RouteNames.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => ForgotPassword(),
        );
      case RouteNames.otpVerificationScreen:
        final arg = settings.arguments as OtpArguments;
        return MaterialPageRoute(
          builder: (context) => OtpScreen(
            signUpModel: arg.signUpModel,
            otpScreenActionEnum: arg.otpScreenActionEnum,
          ),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case RouteNames.passwordReset:
        return MaterialPageRoute(
          builder: (context) => NewPasswordScreen(),
        );
      case RouteNames.bottomNavBar:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case RouteNames.myCart:
        return MaterialPageRoute(
          builder: (context) => const MyCart(),
        );
      case RouteNames.productDetails:
        return MaterialPageRoute(
          builder: (context) => const ProductDetails(),
        );
      case RouteNames.productsViewScreen:
        final args = settings.arguments as ProductViewScreenArgs;
        return MaterialPageRoute(
          builder: (context) => CategoryProducsViewtScreen(
            index: args.index,
          ),
        );
      case RouteNames.stepperScreens:
        return MaterialPageRoute(
          builder: (context) => const StepperScreen(),
        );
      case RouteNames.addAddressScreen:
        return MaterialPageRoute(
          builder: (context) => const AddAddressScreen(),
        );
      case RouteNames.myOrders:
        return MaterialPageRoute(
          builder: (context) => const MyOrders(),
        );
      case RouteNames.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBordingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
