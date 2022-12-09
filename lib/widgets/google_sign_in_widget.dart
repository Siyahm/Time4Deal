import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/sign_in_controller/sign_in_provider.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/sized_boxes.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (context, value, child) => Container(
        width: 140,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.dimWhiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.dimWhiteColor,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign In with',
              style: TextStyle(color: AppColors.themeColor),
            ),
            SizedBoxes.widthBox10,
            value.isLoadingGoogle == true
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                        'lib/assets/google icon.png',
                      )),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
