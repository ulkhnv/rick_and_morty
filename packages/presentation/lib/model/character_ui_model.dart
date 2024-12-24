import 'package:domain/entities/character.dart';

class CharacterUIModel {
  const CharacterUIModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.origin,
    required this.location,
    required this.image,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final Location origin;
  final Location location;
  final String image;

  bool isAlive() {
    return status == "Alive";
  }
}
