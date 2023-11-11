import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/infrastructure/models/guests_attraction.dart';
import 'package:game_tracker_app/src/presentation/screens/guest/guest_screen.dart';
import 'package:go_router/go_router.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({
    super.key,
    required this.user,
  });

  final GuestsAtraction user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.childFullname),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
            child: _text(user.childDescription),
          ),
          Row(
            children: [
              _text('Hora de salida', fontWeight: FontWeight.bold),
              _text(user.departureTime),
            ],
          )
        ],
      ),
      /*Column(
        children: [
          Text(user.childDescription),
          Text('Hora de salida ${user.departureTime}'),
        ],
      ),*/
      onTap: () {
        context.go('/guest/${user.id}');
        // Acción al hacer clic en el usuario
        // Puedes agregar aquí la navegación a una pantalla de detalles, por ejemplo.
      },
    );
  }

  Text _text(String title, {FontWeight? fontWeight}) => Text(
        title,
        style: TextStyle(fontWeight: fontWeight),
      );
}
