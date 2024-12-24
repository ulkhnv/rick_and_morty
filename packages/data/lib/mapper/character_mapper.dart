import 'package:data/mapper/location_mapper.dart';
import 'package:data/models/character_model.dart';
import 'package:domain/entities/character.dart';

abstract class CharacterMapper {
  Character toCharacter(CharacterModel characterModel);
}

class CharacterMapperImpl extends CharacterMapper {
  CharacterMapperImpl({required this.locationMapper});

  final LocationMapper locationMapper;

  @override
  Character toCharacter(CharacterModel characterModel) {
    return Character(
      id: characterModel.id,
      name: characterModel.name,
      status: characterModel.status,
      species: characterModel.species,
      origin: locationMapper.toLocation(characterModel.origin),
      location: locationMapper.toLocation(characterModel.location),
      image: characterModel.image,
    );
  }
}
