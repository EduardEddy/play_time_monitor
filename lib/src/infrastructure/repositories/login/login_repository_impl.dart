import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/domain/datasource/login_datasource.dart';
import 'package:game_tracker_app/src/domain/repositories/login_repository.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_snackbar.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      return await datasource.login(email: email, password: password);
    } on DioException catch (e) {
      final response = json.decode(e.response.toString());
      showCustomSnackBar(context, response['message']);
      return false;
    }
  }
}
