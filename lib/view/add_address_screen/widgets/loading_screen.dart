import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.3,
        width: size.width * 0.5,
        child: Lottie.asset('lib/assets/594-find-location.json'),
      ),
    );
  }
}
