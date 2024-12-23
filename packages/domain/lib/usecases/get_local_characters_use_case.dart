import 'package:domain/entities/character.dart';
import 'package:domain/repositories/character_repository.dart';
import 'package:domain/usecases/base_use_case.dart';

class GetLocalCharactersUseCase
    extends BaseUseCase<Future<List<Character>>, void> {
  GetLocalCharactersUseCase(this._characterRepository);

  final CharacterRepository _characterRepository;

  @override
  Future<List<Character>> call(params) {
    return _characterRepository.getAllCharactersFromLocal();
  }
}
