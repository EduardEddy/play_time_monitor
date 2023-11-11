import 'package:flutter/material.dart';

PreferredSizeWidget appBar({required String title, Function()? back}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    elevation: 5,
    shadowColor: Colors.black12,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 14.0),
        child: InkWell(
          onTap: () => print('object'),
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      )
    ],
    leading: InkWell(
      child: const Icon(
        Icons.arrow_back_sharp,
        color: Colors.white,
      ),
      onTap: back,
    ),
  );
}
