import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/presentation/screens/guests/widgets/list_guests_widget.dart';
import 'package:game_tracker_app/src/presentation/screens/guests/widgets/list_inactive_guests_widget.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

class GuestsScreen extends StatefulWidget {
  static const String name = 'users';
  final String attractionId;
  GuestsScreen({required this.attractionId});

  @override
  State<GuestsScreen> createState() => _GuestsScreenState();
}

class _GuestsScreenState extends State<GuestsScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'listado',
        back: () => context.go('/attractions'),
      ),
      backgroundColor: Colors.grey[200],
      body: <Widget>[
        ListGuestsWidget(attractionId: widget.attractionId),
        ListInactiveGuestsWidget(attractionId: widget.attractionId),
      ][currentPage],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPage,
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Activos',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_off_sharp),
            icon: Icon(Icons.person_off_outlined),
            label: 'Inactivados',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.go('/attractions/${widget.attractionId}/create-guests'),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
