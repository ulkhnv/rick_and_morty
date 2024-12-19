import 'package:data/datasources/character_local_datasource.dart';
import 'package:data/datasources/character_remote_datasource.dart';
import 'package:data/mapper/character_mapper.dart';
import 'package:data/repositories/character_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/repositories/character_repository.dart';
import 'package:domain/usecases/get_all_characters_from_local.dart';
import 'package:domain/usecases/get_all_characters_from_remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/riverpod/character_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final localDataSourceProvider = Provider<CharacterLocalDataSource>(
  (ref) => CharacterLocalDataSourceImpl(
      sharedPreferences: ref.watch(sharedPreferencesProvider)),
);

final remoteDataSourceProvider = Provider<CharacterRemoteDataSource>(
  (ref) => CharacterRemoteDataSourceImpl(dio: Dio()),
);

final characterRepositoryProvider = Provider<CharacterRepository>(
  (ref) => CharacterRepositoryImpl(
    localDataSource: ref.watch(localDataSourceProvider),
    remoteDataSource: ref.watch(remoteDataSourceProvider),
    characterMapper: CharacterMapper(),
  ),
);

final getAllUsersFromLocalProvider = Provider<GetAllCharactersFromLocal>(
  (ref) => GetAllCharactersFromLocal(ref.watch(characterRepositoryProvider)),
);

final getAllUsersFromRemoteProvider = Provider<GetAllCharactersFromRemote>(
  (ref) => GetAllCharactersFromRemote(ref.watch(characterRepositoryProvider)),
);

final characterNotifierProvider =
    StateNotifierProvider<CharacterNotifier, List<Character>>(
  (ref) => CharacterNotifier(
    ref.watch(getAllUsersFromLocalProvider),
    ref.watch(getAllUsersFromRemoteProvider),
  ),
);
