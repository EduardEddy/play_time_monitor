import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/infrastructure/datasources/login/login_datasource_impl.dart';
import 'package:game_tracker_app/src/infrastructure/repositories/login/login_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final loginRepositoryImpl = LoginRepositoryImpl(LoginDatasourceImpl());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  handlerShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  Future<bool> submit(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    bool isLogin = false;
    final resp = await loginRepositoryImpl.login(
        email: _email.text, password: _password.text, context: context);
    if (resp != null && resp != false) {
      final respjson = json.decode(resp.toString());
      prefs.setString('user', json.encode(respjson['data']));
      isLogin = true;
    }
    return isLogin;
  }

  GlobalKey get formKey => _formKey;
  bool get showPassword => _showPassword;
  TextEditingController get email => _email;
  TextEditingController get password => _password;
}
