import 'package:data/datasources/character_local_datasource.dart';
import 'package:data/datasources/character_remote_datasource.dart';
import 'package:data/mapper/character_mapper.dart';
import 'package:data/mapper/location_mapper.dart';
import 'package:data/repositories/character_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/repositories/character_repository.dart';
import 'package:domain/usecases/get_local_characters_use_case.dart';
import 'package:domain/usecases/get_remote_characters_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/mapper/character_ui_mapper.dart';
import 'package:presentation/model/character_ui_model.dart';
import 'package:presentation/riverpod/character_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) => SharedPreferences.getInstance());
final locationMapperProvider = Provider<LocationMapper>(
  (ref) => LocationMapperImpl(),
);

final characterMapperProvider = Provider<CharacterMapper>(
  (ref) => CharacterMapperImpl(
    locationMapper: ref.watch(locationMapperProvider),
  ),
);

final characterUIMapperProvider =
    Provider<CharacterUIMapper>((ref) => CharacterUIMapperImpl());

final localDataSourceProvider = Provider<CharacterLocalDataSource>(
  (ref) => CharacterLocalDataSourceImpl(
      sharedPreferences: ref.watch(sharedPreferencesProvider).value!),
);

final remoteDataSourceProvider = Provider<CharacterRemoteDataSource>(
  (ref) => CharacterRemoteDataSourceImpl(dio: Dio()),
);

final characterRepositoryProvider = Provider<CharacterRepository>(
  (ref) => CharacterRepositoryImpl(
    localDataSource: ref.watch(localDataSourceProvider),
    remoteDataSource: ref.watch(remoteDataSourceProvider),
    characterMapper: ref.watch(characterMapperProvider),
  ),
);

final getAllUsersFromLocalProvider = Provider<GetLocalCharactersUseCase>(
  (ref) => GetLocalCharactersUseCase(ref.watch(characterRepositoryProvider)),
);

final getAllUsersFromRemoteProvider = Provider<GetRemoteCharactersUseCase>(
  (ref) => GetRemoteCharactersUseCase(ref.watch(characterRepositoryProvider)),
);

final characterNotifierProvider =
    StateNotifierProvider<CharacterNotifier, List<CharacterUIModel>>(
  (ref) => CharacterNotifier(
    ref.watch(getAllUsersFromLocalProvider),
    ref.watch(getAllUsersFromRemoteProvider),
    ref.watch(characterUIMapperProvider),
  ),
);
