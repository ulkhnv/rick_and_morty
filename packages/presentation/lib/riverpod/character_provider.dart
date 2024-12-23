import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/model/character_ui_model.dart';
import 'package:rick_and_morty/core/di.dart';

final characterProvider = FutureProvider<List<CharacterUIModel>>((ref) async {
  final characterState = ref.watch(characterNotifierProvider);

  if (characterState.isEmpty) {
    await ref.read(characterNotifierProvider.notifier).getAllCharacters();
  }
  return characterState;
});
