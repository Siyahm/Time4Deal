import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/add_address_screen_controller/add_address_controller.dart';
import 'package:time4deal/controller/bottom_nav_bar_controller/bottom_nav_bar_provider.dart';
import 'package:time4deal/controller/cart_controller/cart_controller.dart';
import 'package:time4deal/controller/forgot_password_controller/forgot_password_provider.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/controller/new_password_conttoller/new_password_provider.dart';
import 'package:time4deal/controller/onbording_controller/onbording_provider.dart';
import 'package:time4deal/controller/otp_controller/otp_controller.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/controller/products_view_screen_controller/product_view_screen_controller.dart';
import 'package:time4deal/controller/profile_controller/profile_contoller.dart';
import 'package:time4deal/controller/sign_in_controller/sign_in_provider.dart';
import 'package:time4deal/controller/sign_up_controller/sign_up_controller.dart';
import 'package:time4deal/controller/spalsh_controller/splash_provider.dart';
import 'package:time4deal/controller/stepper_controller/stepper_controller.dart';
import 'package:time4deal/controller/wish_list_controller/wish_list_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/routes/routs.dart';
import 'package:time4deal/utils/navigation_context.dart';
import 'package:time4deal/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((_) => SpalashScreenProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => SignUpProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => SignInProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => ForgotPasswordProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => OtpProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => NewPasswordProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => OnbordingProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => BottomNavBarProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => HomeController()),
        ),
        ChangeNotifierProvider(
          create: ((_) => WishListController()),
        ),
        ChangeNotifierProvider(
          create: ((_) => ProductDetailsContoller()),
        ),
        ChangeNotifierProvider(
          create: ((_) => ProductViewScreenController()),
        ),
        ChangeNotifierProvider(
          create: ((_) => StepperController()),
        ),
        ChangeNotifierProvider(
          create: ((_) => AddAddressController()),
        ),
        ChangeNotifierProvider(
          create: ((_) => ProfileController()),
        ),
        ChangeNotifierProvider(
          create: ((_) => CartController()),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationContextService.navigatorContextKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: ((settings) => AppRouts.generateRoute(settings)),
        title: 'Time4Deal',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.bgColor,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.transperantColor,
          ),
        ),
        // darkTheme: ThemeData.dark(),
        home: const SplashScreen(),
      ),
    );
  }
}
