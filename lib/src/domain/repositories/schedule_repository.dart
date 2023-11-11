import 'package:flutter/material.dart';

abstract class ScheduleRepository {
  Future list(BuildContext context, String attraction);
}
