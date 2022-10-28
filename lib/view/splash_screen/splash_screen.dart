import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/spalsh_controller/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SpalashScreenProvider>(context, listen: false)
          .goHome(context);
    });
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 150,
          child: Image(
            image: AssetImage('lib/assets/time4dea.png'),
          ),
        ),
      ),
    );
  }
}
