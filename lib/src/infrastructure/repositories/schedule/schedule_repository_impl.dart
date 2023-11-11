import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:game_tracker_app/src/domain/datasource/schedule_datasource.dart';
import 'package:game_tracker_app/src/domain/repositories/schedule_repository.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_snackbar.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  final ScheduleDatasource datasource;

  ScheduleRepositoryImpl(this.datasource);

  @override
  Future list(BuildContext context, String attraction) async {
    try {
      return await datasource.list(attraction);
    } on DioException catch (e) {
      final response = json.decode(e.response.toString());
      showCustomSnackBar(context, response['message']);
    }
  }
}
