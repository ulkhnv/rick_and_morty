import 'package:domain/entities/character.dart';
import 'package:domain/repositories/character_repository.dart';

class GetAllCharactersFromLocal {
  final CharacterRepository _characterRepository;

  GetAllCharactersFromLocal(this._characterRepository);

  Future<List<Character>> call() {
    return _characterRepository.getAllCharactersFromLocal();
  }
}
