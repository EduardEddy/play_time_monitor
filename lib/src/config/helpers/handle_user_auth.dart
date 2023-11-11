import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../infrastructure/models/user.dart';

class HandleUserAuth {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future getUserAuth() async {
    final SharedPreferences prefs = await _prefs;
    final localStorage = prefs.getString('user');
    if (localStorage != null) {
      return User.fromJson(json.decode(localStorage));
    }
    return null;
  }
}
