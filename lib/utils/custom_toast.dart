import 'package:flutter/animation.dart';
import 'package:fluttertoast/fluttertoast.dart';

void customToast(String msg, Color color) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: color,
  );
}
