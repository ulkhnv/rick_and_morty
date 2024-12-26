import 'package:data/datasources/character_local_datasource.dart';
import 'package:data/datasources/character_remote_datasource.dart';
import 'package:data/mapper/character_mapper.dart';
import 'package:data/mapper/location_mapper.dart';
import 'package:data/repositories/character_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/repositories/character_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setupData(GetIt sl) async {
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      characterMapper: sl(),
    ),
  );

  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<CharacterLocalDataSource>(
    () => CharacterLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<CharacterMapper>(
    () => CharacterMapperImpl(locationMapper: sl()),
  );

  sl.registerLazySingleton<LocationMapper>(() => LocationMapperImpl());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
}
