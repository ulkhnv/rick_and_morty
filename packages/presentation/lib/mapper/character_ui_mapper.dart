import 'package:domain/entities/character.dart';
import 'package:presentation/model/character_ui_model.dart';

abstract class CharacterUIMapper {
  CharacterUIModel toUIModel(Character character);
}

class CharacterUIMapperImpl extends CharacterUIMapper {
  @override
  CharacterUIModel toUIModel(Character character) {
    return CharacterUIModel(
      id: character.id,
      name: character.name,
      status: character.status,
      species: character.species,
      origin: character.origin,
      location: character.location,
      image: character.image,
    );
  }
}
