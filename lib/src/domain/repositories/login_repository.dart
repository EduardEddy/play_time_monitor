import 'package:flutter/material.dart';

abstract class LoginRepository {
  Future login(
      {required String email,
      required String password,
      required BuildContext context});
}
