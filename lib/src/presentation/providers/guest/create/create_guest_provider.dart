import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/infrastructure/datasources/guest_attraction/guest_attraction_datasource_impl.dart';
import 'package:game_tracker_app/src/infrastructure/datasources/schedule/schedule_datasource_impl.dart';
import 'package:game_tracker_app/src/infrastructure/repositories/guest_attraction/guest_attraction_repository_impl.dart';
import 'package:game_tracker_app/src/infrastructure/repositories/schedule/schedule_repository_impl.dart';

class CreateGuestProvider with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullnameKid = TextEditingController();
  final TextEditingController _fullnameParent = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final List schedule = [];
  final _scheduleRepository = ScheduleRepositoryImpl(ScheduleDatasourceImpl());
  String? selected;
  final guestAttractionRepository =
      GuestAttractionRepositoryImpl(GuestAttractionDatasourceImpl());

  CreateGuestProvider(BuildContext context, String attraction) {
    getSchedule(context, attraction);
  }

  submit(BuildContext context, attraction) {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      final Map<String, String> data = {
        'child_fullname': _fullnameKid.text,
        'child_description': _description.text,
        'parent_fullname': _fullnameParent.text,
        'cellphone': _phone.text,
        'price_attraction_id': selected!,
        'entry_time': parseTime()
      };
      guestAttractionRepository.create(context,
          data: data, attraction: attraction);
    }
  }

  String parseTime() {
    DateTime currentDate = DateTime.now();
    return '${currentDate.hour}:${currentDate.minute}';
  }

  getSchedule(BuildContext context, String attraction) async {
    final resp = await _scheduleRepository.list(context, attraction);
    final respjson = json.decode(resp.toString());
    final List list = respjson['data'];
    final List parse = list
        .map((e) =>
            {'id': e['id'], 'name': '${e['time']} min - \$${e['price']}'})
        .toList();
    schedule.addAll(parse);
    notifyListeners();
  }

  onChange(String data) {
    selected = data;
    notifyListeners();
  }

  get formKey => _formKey;
  TextEditingController get fullnameKid => _fullnameKid;
  TextEditingController get fullnameParent => _fullnameParent;
  TextEditingController get description => _description;
  TextEditingController get phone => _phone;
}
