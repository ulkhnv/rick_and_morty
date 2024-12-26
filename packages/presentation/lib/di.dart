import 'package:get_it/get_it.dart';
import 'package:presentation/bloc/character_bloc.dart';
import 'package:presentation/mapper/character_ui_mapper.dart';

Future<void> setupPresentation(GetIt sl) async {
  sl.registerFactory<CharacterBloc>(
    () => CharacterBloc(
      getLocalCharactersUseCase: sl(),
      getRemoteCharactersUseCase: sl(),
      mapper: sl(),
    ),
  );

  sl.registerLazySingleton<CharacterUIMapper>(() => CharacterUIMapperImpl());
}
