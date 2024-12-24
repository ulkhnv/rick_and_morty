import 'package:domain/usecases/get_local_characters_use_case.dart';
import 'package:domain/usecases/get_remote_characters_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/mapper/character_ui_mapper.dart';
import 'package:presentation/model/character_ui_model.dart';

class CharacterNotifier extends StateNotifier<List<CharacterUIModel>> {
  CharacterNotifier(
    this._getAllCharactersFromLocal,
    this._getAllCharactersFromRemote,
    this._characterMapper,
  ) : super([]);

  final GetLocalCharactersUseCase _getAllCharactersFromLocal;
  final GetRemoteCharactersUseCase _getAllCharactersFromRemote;
  final CharacterUIMapper _characterMapper;

  Future<void> getAllCharacters() async {
    final localCharacters = await _getAllCharactersFromLocal.call(null);
    state = localCharacters.map(_characterMapper.toUIModel).toList();
    final remoteCharacters = await _getAllCharactersFromRemote.call(null);
    state = remoteCharacters.map(_characterMapper.toUIModel).toList();
  }
}
