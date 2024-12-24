import 'package:domain/entities/character.dart';
import 'package:domain/repositories/character_repository.dart';
import 'package:domain/usecases/base_use_case.dart';

class GetRemoteCharactersUseCase
    extends BaseUseCase<Future<List<Character>>, void> {
  GetRemoteCharactersUseCase(this._characterRepository);

  final CharacterRepository _characterRepository;

  Future<List<Character>> call(void params) {
    return _characterRepository.getAllCharactersFromRemote();
  }
}
