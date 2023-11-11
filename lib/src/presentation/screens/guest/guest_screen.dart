import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_appbar.dart';

class GuestScreen extends StatelessWidget {
  final String id;
  const GuestScreen({super.key, required this.id});
  static const String name = 'guest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Datos de niño'),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                width: .5,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TextOnCard(
                  title: 'Niño',
                  subTitle: 'Eduard Acevedo',
                ),
                _TextOnCard(
                  title: '',
                  subTitle: 'Niño gordito',
                ),
                _TextOnCard(
                  title: 'Representante ',
                  subTitle: 'Auxiliadora Bracho',
                ),
                _TextOnCard(
                  title: 'Telf ',
                  subTitle: '3046719444',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TextOnCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const _TextOnCard({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: subTitle,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
