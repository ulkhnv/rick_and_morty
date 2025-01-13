import 'package:presentation/model/character_ui_model.dart';

class CharacterDetailArgs {
  final int index;
  final List<CharacterUIModel> characters;

  CharacterDetailArgs({required this.index, required this.characters});
}
