import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
