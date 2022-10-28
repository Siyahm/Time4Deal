import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';

class LongElevatedButton extends StatelessWidget {
  const LongElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
