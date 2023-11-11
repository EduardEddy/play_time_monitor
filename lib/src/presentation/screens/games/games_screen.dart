import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_tracker_app/src/presentation/providers/games/game_provider.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});
  static const name = '/games';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: 'Juegos'),
        body: ChangeNotifierProvider(
          create: (_) => GameProvider(context),
          child: Consumer<GameProvider>(
            builder: (context, data, child) {
              if (data.games.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final game = data.games[index];
                    return InkWell(
                      onTap: () =>
                          context.go('/attractions/${game['id']}/guests'),
                      child: Card(
                        elevation: 5.0,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/face.svg',
                              width: 120,
                            ),
                            const SizedBox(height: 10),
                            ListTile(
                              title: Text('Juego: ${game['name']}'),
                              subtitle: Text(game['description']),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ));
  }
}
