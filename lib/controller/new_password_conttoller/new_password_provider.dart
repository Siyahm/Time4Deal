import 'package:flutter/material.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/service/new_password/new_password_services.dart';
import 'package:time4deal/utils/custom_toast.dart';

class NewPasswordProvider with ChangeNotifier {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void onResetButtonPressed(
      GlobalKey<FormState> formKey, BuildContext context, String email) async {
    if (formKey.currentState!.validate()) {
      NewPasswordService()
          .resetPassword(email, newPasswordController.text)
          .then((value) {
        if (value != null) {
          customToast(value, Colors.green);
          Navigator.of(context).pushReplacementNamed(RouteNames.signInScreen);
        }
      });
    }
    //
  }
}
