import 'package:domain/usecases/get_local_characters_use_case.dart';
import 'package:domain/usecases/get_remote_characters_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/character_event.dart';
import 'package:presentation/bloc/character_state.dart';
import 'package:presentation/mapper/character_ui_mapper.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(
      {required this.getLocalCharactersUseCase,
      required this.getRemoteCharactersUseCase,
      required this.mapper})
      : super(CharacterLoading()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
  }

  final GetLocalCharactersUseCase getLocalCharactersUseCase;
  final GetRemoteCharactersUseCase getRemoteCharactersUseCase;
  final CharacterUIMapper mapper;

  void _onLoadCharacters(
      LoadCharactersEvent event, Emitter<CharacterState> emit) async {
    final localCharacters = await getLocalCharactersUseCase.call(null);
    emit(CharacterLoaded(
        characters: localCharacters.map(mapper.toUIModel).toList()));
    print("local");
    final remoteCharacters = await getRemoteCharactersUseCase.call(null);
    emit(CharacterLoaded(
        characters: remoteCharacters.map(mapper.toUIModel).toList()));
    print("remote");
  }
}
