import 'package:flutter/material.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomeAppBar(
        leadingWidget: SizedBox(),
        trailing: SizedBox(),
      ),
      body: SafeArea(
        child: Center(
          child: Text('My orders screen'),
        ),
      ),
    );
  }
}
