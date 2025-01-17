import 'dart:async';

import 'package:domain/usecases/get_local_characters_use_case.dart';
import 'package:domain/usecases/get_remote_characters_use_case.dart';
import 'package:presentation/bloc/bloc.dart';
import 'package:presentation/mapper/character_ui_mapper.dart';
import 'package:presentation/model/character_ui_model.dart';
import 'package:presentation/screens/character_detail_screen.dart';
import 'package:presentation/screens/character_tile.dart';

class CharacterBloc extends BlocImpl<CharacterTile> {
  CharacterBloc({
    required this.getLocalCharactersUseCase,
    required this.getRemoteCharactersUseCase,
    required this.mapper,
  });

  final GetLocalCharactersUseCase getLocalCharactersUseCase;
  final GetRemoteCharactersUseCase getRemoteCharactersUseCase;
  final CharacterUIMapper mapper;

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    handleData(
      isLoading: true,
      data: CharacterTile.init(),
    );

    final localCharacters = await getLocalCharactersUseCase.call(null);
    final localUIModels = localCharacters.map(mapper.toUIModel).toList();

    handleData(
      isLoading: false,
      data: CharacterTile(characters: localUIModels),
    );

    final remoteCharacters = await getRemoteCharactersUseCase.call(null);
    final remoteUIModels = remoteCharacters.map(mapper.toUIModel).toList();

    handleData(
      isLoading: false,
      data: CharacterTile(characters: remoteUIModels),
    );
  }

  void pushCharacterDetailScreen(List<CharacterUIModel> characters, int index) {
    appNavigator.push(CharacterDetailScreen.page(characters, index));
  }
}
