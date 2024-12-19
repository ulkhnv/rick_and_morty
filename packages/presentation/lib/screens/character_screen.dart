import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/riverpod/character_provider.dart';
import 'package:presentation/widgets/character_card_widget.dart';

class CharacterScreen extends ConsumerWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersState = ref.watch(characterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        centerTitle: true,
      ),
      body: charactersState.when(
        data: (characters) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return CharacterCard(character: characters[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: characters.length);
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
