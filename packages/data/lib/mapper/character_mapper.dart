import 'package:data/models/character_model.dart';
import 'package:domain/entities/character.dart';

class CharacterMapper {
  Character toCharacter(CharacterModel characterModel) {
    return Character(
      id: characterModel.id,
      name: characterModel.name,
      status: characterModel.status,
      species: characterModel.species,
      origin: characterModel.origin,
      location: characterModel.location,
      image: characterModel.image,
    );
  }
}
