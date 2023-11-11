import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/infrastructure/models/guests_attraction.dart';
import 'package:game_tracker_app/src/presentation/providers/guests/guests_provider.dart';
import 'package:game_tracker_app/src/presentation/screens/guests/widgets/custom_list_title.dart';
import 'package:game_tracker_app/src/presentation/widgets/show_info_widget.dart';
import 'package:provider/provider.dart';

class ListGuestsWidget extends StatelessWidget {
  final String attractionId;
  const ListGuestsWidget({super.key, required this.attractionId});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => GuestsProvider(context, attraction: attractionId),
      child: Consumer<GuestsProvider>(
        builder: (__, data, child) {
          if (data.isLoading) {
            return const ShowInfo(child: CircularProgressIndicator());
          }
          if (!data.isLoading && data.guests.isEmpty) {
            return const ShowInfo(child: Text('No hay niños registrados aún'));
          }
          return ListView.builder(
            itemCount: data.guests.length,
            itemBuilder: (context, index) {
              final GuestsAtraction user = data.guests[index];
              return Dismissible(
                key: ValueKey<int>(user.id),
                background: Container(
                  padding: const EdgeInsets.only(right: 15),
                  color: Colors.red,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: size.width * 0.1,
                  ),
                ),
                onDismissed: (DismissDirection direction) => data.removeGuest(
                  context,
                  user.guestAttractionId.toString(),
                ),
                direction: DismissDirection.endToStart,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, .8),
                  child: CardTitle(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
