import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screens/character_screen.dart';

class AppTile {
  AppTile({required this.pages});

  final List<BasePage> pages;

  factory AppTile.init() => AppTile(
        pages: [CharacterScreen.page()],
      );
}
