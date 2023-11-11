import 'package:flutter/material.dart';

abstract class GuestsAttractionRepository {
  Future create(BuildContext context,
      {required Map<String, String> data, required String attraction});
}
