import 'package:flutter/material.dart';

class LongElevatedButton extends StatelessWidget {
  const LongElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.color,
    this.decoration,
  }) : super(key: key);
  final Widget child;
  final void Function()? onPressed;
  final Color color;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
            ),
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}
