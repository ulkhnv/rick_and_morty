import 'package:domain/entities/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/di.dart';

final characterProvider = FutureProvider<List<Character>>((ref) async {
  final characterState = ref.watch(characterNotifierProvider);

  if (characterState.isEmpty) {
    await ref.read(characterNotifierProvider.notifier).getAllCharacters();
  }
  return characterState;
});
