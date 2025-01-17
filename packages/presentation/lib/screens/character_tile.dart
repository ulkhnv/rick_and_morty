import 'package:presentation/model/character_ui_model.dart';

class CharacterTile {
  CharacterTile({required this.characters});

  final List<CharacterUIModel> characters;

  factory CharacterTile.init() => CharacterTile(characters: []);
}
