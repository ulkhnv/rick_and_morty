import 'package:domain/entities/character.dart';
import 'package:domain/repositories/character_repository.dart';

class GetAllCharactersFromRemote {
  final CharacterRepository _characterRepository;

  GetAllCharactersFromRemote(this._characterRepository);

  Future<List<Character>> call() {
    return _characterRepository.getAllCharactersFromRemote();
  }
}
