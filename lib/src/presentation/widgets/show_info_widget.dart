import 'package:flutter/material.dart';

class ShowInfo extends StatelessWidget {
  final Widget child;

  const ShowInfo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }
}
