import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/bottom_nav_bar_controller/bottom_nav_bar_provider.dart';
import 'package:time4deal/controller/forgot_password_controller/forgot_password_provider.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/controller/new_password_conttoller/new_password_provider.dart';
import 'package:time4deal/controller/onbording_controller/onbording_provider.dart';
import 'package:time4deal/controller/otp_controller/otp_controller.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/controller/sign_in_controller/sign_in_provider.dart';
import 'package:time4deal/controller/sign_up_controller/sign_up_provider.dart';
import 'package:time4deal/controller/spalsh_controller/splash_provider.dart';
import 'package:time4deal/controller/wish_list_controller/wish_list_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/routes/routs.dart';
import 'package:time4deal/view/on_boarding/on_bording_screen.dart';
import 'package:time4deal/widgets/bottom_nav_bar.dart';

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
      ],
      child: MaterialApp(
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
        home: const BottomNavBar(),
      ),
    );
  }
}
