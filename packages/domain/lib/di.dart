import 'package:domain/usecases/get_local_characters_use_case.dart';
import 'package:domain/usecases/get_remote_characters_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> setupDomain(GetIt sl) async {
  sl.registerLazySingleton<GetRemoteCharactersUseCase>(
    () => GetRemoteCharactersUseCase(sl()),
  );

  sl.registerLazySingleton<GetLocalCharactersUseCase>(
    () => GetLocalCharactersUseCase(sl()),
  );
}
