import 'package:data/models/character_model.dart';
import 'package:dio/dio.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacters();
}

const String baseCharacterUrl = 'https://rickandmortyapi.com/api/character';

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Dio dio;

  CharacterRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      final response = await dio.get(baseCharacterUrl);
      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((e) => CharacterModel.fromJson(e))
            .toList();
      } else {
        throw Exception(
            'Error while loading characters: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Unknown exception: $e');
    }
  }
}
