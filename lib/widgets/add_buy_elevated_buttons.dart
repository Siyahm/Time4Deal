import 'package:flutter/material.dart';

class AddAndBuyElevatedButton extends StatelessWidget {
  const AddAndBuyElevatedButton(
      {Key? key,
      required this.color,
      required this.label,
      required this.ontap,
      required this.labelStyle})
      : super(key: key);

  final Color color;
  final String label;
  final VoidCallback ontap;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(size.width * 0.3, size.height * 0.06),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: ontap,
        child: Text(
          label,
          style: labelStyle,
        ),
      ),
    );
  }
}
