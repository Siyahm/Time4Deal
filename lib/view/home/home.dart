import 'package:flutter/material.dart';
import 'package:time4deal/view/home/widget/custome_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text('home page'),
          ],
        ),
      ),
    );
  }
}
