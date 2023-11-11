import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message,
    {Color? bgColor}) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: bgColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
