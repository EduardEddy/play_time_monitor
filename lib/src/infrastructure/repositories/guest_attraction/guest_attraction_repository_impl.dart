import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:game_tracker_app/src/domain/datasource/guest_attraction_datasource.dart';
import 'package:game_tracker_app/src/domain/repositories/guest_attraction_repository.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_snackbar.dart';

class GuestAttractionRepositoryImpl extends GuestsAttractionRepository {
  final GuestAttractionDatasource datasource;

  GuestAttractionRepositoryImpl(this.datasource);
  @override
  Future create(BuildContext context,
      {required Map<String, String> data, required String attraction}) async {
    try {
      final resp = await datasource.create(data: data, attraction: attraction);
      showCustomSnackBar(
        context,
        'Procesado con ëxito',
        bgColor: Colors.lightGreenAccent,
      );
      return resp;
    } on DioException catch (e) {
      final response = json.decode(e.response.toString());
      showCustomSnackBar(context, response['message']);
      return false;
    }
  }
}
