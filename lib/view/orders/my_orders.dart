import 'package:flutter/material.dart';
import 'package:time4deal/utils/common_functions.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        leadingWidget: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            CommonFunctions.popFunction(context);
          },
        ),
        trailing: const SizedBox(),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('My orders screen'),
        ),
      ),
    );
  }
}
