import 'package:flutter/material.dart';
import 'package:time4deal/utils/app_utils.dart';

class CustomAppBarLeadingWidget extends StatelessWidget {
  const CustomAppBarLeadingWidget({super.key});

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
