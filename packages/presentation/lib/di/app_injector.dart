import 'package:get_it/get_it.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/mapper/character_ui_mapper.dart';
import 'package:presentation/navigator/base_navigator.dart';
import 'package:presentation/screens/character_bloc.dart';

Future<void> setupPresentation(GetIt sl) async {
  sl.registerFactory<AppBloc>(() => AppBloc());

  sl.registerFactory<CharacterBloc>(() => CharacterBloc(
        getLocalCharactersUseCase: sl(),
        getRemoteCharactersUseCase: sl(),
        mapper: sl(),
      ));

  sl.registerSingleton<NavigatorImpl>(NavigatorImpl());

  sl.registerLazySingleton<CharacterUIMapper>(() => CharacterUIMapperImpl());
}
