import 'package:data/datasources/character_local_datasource.dart';
import 'package:data/datasources/character_remote_datasource.dart';
import 'package:data/mapper/character_mapper.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterLocalDataSource localDataSource;
  final CharacterRemoteDataSource remoteDataSource;
  final CharacterMapper characterMapper;

  CharacterRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.characterMapper,
  });

  @override
  Future<List<Character>> getAllCharactersFromLocal() async {
    final characterModels = await localDataSource.getAllCharacters();
    return characterModels.map((e) => characterMapper.toCharacter(e)).toList();
  }

  @override
  Future<List<Character>> getAllCharactersFromRemote() async {
    final characterModels = await remoteDataSource.getAllCharacters();
    localDataSource.saveAllCharacters(characterModels);
    return characterModels.map((e) => characterMapper.toCharacter(e)).toList();
  }
}
