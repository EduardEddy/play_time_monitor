import 'package:flutter/material.dart';

abstract class GuestsRepository {
  Future list(BuildContext context,
      {required int attraction, required int isActive});
  Future remove(BuildContext context, {required String guestAttractionId});
}
