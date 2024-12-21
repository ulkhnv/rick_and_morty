import 'package:domain/entities/character.dart';
import 'package:domain/usecases/get_all_characters_from_local.dart';
import 'package:domain/usecases/get_all_characters_from_remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterNotifier extends StateNotifier<List<Character>> {
  final GetAllCharactersFromLocal _getAllCharactersFromLocal;
  final GetAllCharactersFromRemote _getAllCharactersFromRemote;

  CharacterNotifier(
    this._getAllCharactersFromLocal,
    this._getAllCharactersFromRemote,
  ) : super([]);

  Future<void> getAllCharacters() async {
    state = await _getAllCharactersFromLocal.call();
    state = await _getAllCharactersFromRemote.call();
  }
}
