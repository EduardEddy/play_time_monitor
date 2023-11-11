import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/infrastructure/datasources/games/game_datasources_impl.dart';
import 'package:game_tracker_app/src/infrastructure/repositories/games/game_repository_impl.dart';

class GameProvider with ChangeNotifier {
  final List games = [];
  bool spiner = true;
  final gameRepositoryImpl = GameRepositoryImpl(GameDataSourcesImpl());
  GameProvider(BuildContext context) {
    getList(context);
  }

  Future<void> getList(BuildContext context) async {
    final resp = await gameRepositoryImpl.list(context);
    final respjson = json.decode(resp.toString());
    games.addAll(respjson['data']);
    notifyListeners();
  }
}
