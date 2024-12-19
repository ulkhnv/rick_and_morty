import '../entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getAllCharactersFromLocal();
  Future<List<Character>> getAllCharactersFromRemote();
}
