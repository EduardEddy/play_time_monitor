import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/infrastructure/datasources/guests/guests_datasources_impl.dart';
import 'package:game_tracker_app/src/infrastructure/models/guests_attraction.dart';
import 'package:game_tracker_app/src/infrastructure/repositories/guests/guests_repository_impl.dart';

class GuestsProvider extends ChangeNotifier {
  final guestsRepository = GuestsRepositoryImpl(GuestsDatasourcesImpl());
  bool isLoading = true;
  final String attraction;
  final List<GuestsAtraction> _guests = [];
  int _activePage = 0;

  GuestsProvider(BuildContext context,
      {required this.attraction, int isActive = 1}) {
    getList(context, attraction, isActive: isActive);
  }

  Future getList(BuildContext context, attraction,
      {required int isActive}) async {
    final list = await guestsRepository.list(context,
        attraction: int.parse(attraction), isActive: isActive);
    final respjson = json.decode(list.toString());

    final List<GuestsAtraction> guests_ = respjson['data']
        .map<GuestsAtraction>((guests) => GuestsAtraction.fromJson(guests))
        .toList();

    _guests.addAll(guests_);
    isLoading = false;
    notifyListeners();
  }

  set setPage(int number) {
    _activePage = number;
    notifyListeners();
  }

  removeGuest(BuildContext context, String guestAttractionId) {
    guestsRepository.remove(context, guestAttractionId: guestAttractionId);
  }

  List get guests => _guests;
  int get activePage => _activePage;
}
