import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final Key keyForm;
  final Widget child;
  const CustomForm({super.key, required this.keyForm, required this.child});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: child,
    );
  }
}
