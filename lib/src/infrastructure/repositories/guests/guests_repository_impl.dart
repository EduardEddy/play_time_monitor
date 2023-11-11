import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/domain/datasource/guests_datasource.dart';
import 'package:game_tracker_app/src/domain/repositories/guests_repository.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_snackbar.dart';

class GuestsRepositoryImpl implements GuestsRepository {
  final GuestsDatasource guestsDatasource;

  GuestsRepositoryImpl(this.guestsDatasource);
  @override
  Future list(BuildContext context,
      {required int attraction, required int isActive}) async {
    try {
      return await guestsDatasource.list(attraction, isActive);
    } on DioException catch (e) {
      final response = json.decode(e.response.toString());
      showCustomSnackBar(context, response['message']);
      return false;
    }
  }

  @override
  Future remove(BuildContext context,
      {required String guestAttractionId}) async {
    try {
      return await guestsDatasource.remove(guestAttractionId);
    } on DioException catch (e) {
      final response = json.decode(e.response.toString());
      showCustomSnackBar(context, response['message']);
      return false;
    }
  }
}
