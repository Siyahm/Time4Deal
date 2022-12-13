import 'package:flutter/material.dart';
import 'package:time4deal/utils/app_utils.dart';

class AppPopUp {
  showDialogueBox(BuildContext context, String title, VoidCallback ontap) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              onPressed: () {
                AppUtils.popFunction(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: ontap,
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
