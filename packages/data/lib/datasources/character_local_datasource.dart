import 'dart:convert';

import 'package:data/models/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CharacterLocalDataSource {
  Future<List<CharacterModel>> getAllCharacters();

  Future<void> saveAllCharacters(List<CharacterModel> characterModels);
}

const cachedCharacters = "cachedCharacters";

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final SharedPreferences sharedPreferences;

  CharacterLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CharacterModel>> getAllCharacters() {
    final jsonCharacterModels =
        sharedPreferences.getStringList(cachedCharacters);

    if (jsonCharacterModels == null || jsonCharacterModels.isEmpty) {
      return Future.value([]);
    }
    return Future.value(jsonCharacterModels
        .map((e) => CharacterModel.fromJson(json.decode(e)))
        .toList());
  }

  @override
  Future<void> saveAllCharacters(List<CharacterModel> characterModels) {
    final jsonCharactersModel =
        characterModels.map((e) => json.encode(e)).toList();
    return sharedPreferences.setStringList(
        cachedCharacters, jsonCharactersModel);
  }
}