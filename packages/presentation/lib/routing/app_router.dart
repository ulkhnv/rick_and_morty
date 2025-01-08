import 'package:go_router/go_router.dart';
import 'package:presentation/model/character_detail_args.dart';
import 'package:presentation/screens/character_detail_screen.dart';
import 'package:presentation/screens/character_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/characters",
    routes: [
      GoRoute(
        path: "/characters",
        builder: (context, state) => CharacterScreen(),
        routes: [
          GoRoute(
            path: "character-detail",
            builder: (context, state) {
              final args = state.extra as CharacterDetailArgs;
              return CharacterDetailScreen(
                characters: args.characters,
                index: args.index,
              );
            },
          )
        ],
      ),
    ],
  );
}
