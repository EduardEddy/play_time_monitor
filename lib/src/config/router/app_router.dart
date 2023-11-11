import 'package:game_tracker_app/src/presentation/screens/games/games_screen.dart';
import 'package:game_tracker_app/src/presentation/screens/guest/create/create_guest_screen.dart';
import 'package:game_tracker_app/src/presentation/screens/guest/guest_screen.dart';
import 'package:game_tracker_app/src/presentation/screens/login/login_screen.dart';
import 'package:game_tracker_app/src/presentation/screens/guests/guests_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/attractions',
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/attractions',
      name: GamesScreen.name,
      builder: (context, state) => const GamesScreen(),
    ),
    GoRoute(
      path: '/attractions/:id/guests',
      name: GuestsScreen.name,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return GuestsScreen(attractionId: id);
      },
    ),
    GoRoute(
      path: '/attractions/:id/create-guests',
      name: CreateGuestScreen.name,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CreateGuestScreen(attractionId: id);
      },
    ),
    GoRoute(
      path: '/guest/:id',
      name: GuestScreen.name,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return GuestScreen(id: id);
      },
    )
  ],
);
