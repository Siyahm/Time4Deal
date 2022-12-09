import 'package:flutter/material.dart';
import 'package:time4deal/utils/app_utils.dart';

class ShowDiologueBox {
  showDialogueBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Do you want to log out ?'),
          actions: [
            TextButton(
              onPressed: () {
                AppUtils.popFunction(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
