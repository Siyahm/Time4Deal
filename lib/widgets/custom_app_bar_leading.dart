import 'package:flutter/material.dart';
import 'package:time4deal/utils/app_utils.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AppUtils.popFunction(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
}
