import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:game_tracker_app/src/domain/datasource/game_datasource.dart';
import 'package:game_tracker_app/src/domain/repositories/game_repository.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_snackbar.dart';

class GameRepositoryImpl extends GameRepository {
  final GameDatasource gameDatasource;

  GameRepositoryImpl(this.gameDatasource);

  @override
  Future list(BuildContext context) async {
    try {
      return await gameDatasource.list();
    } on DioException catch (e) {
      final response = json.decode(e.response.toString());
      showCustomSnackBar(context, response['message']);
      return false;
    }
  }
}
