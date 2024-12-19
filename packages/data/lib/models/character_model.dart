import 'package:data/models/location_model.dart';
import 'package:domain/entities/character.dart';

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final Location origin;
  final Location location;
  final String image;

  const CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      origin: LocationModel.fromJson(json['origin']),
      location: LocationModel.fromJson(json['location']),
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'origin': origin,
      'location': location,
      'image': image,
    };
  }
}