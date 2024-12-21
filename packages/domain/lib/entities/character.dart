import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final Location origin;
  final Location location;
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.origin,
    required this.location,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        origin,
        location,
        image,
      ];
}

class Location {
  final String name;
  final String url;

  const Location({
    required this.name,
    required this.url,
  });
}
