import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/character_bloc.dart';
import 'package:presentation/bloc/character_event.dart';
import 'package:presentation/bloc/character_state.dart';
import 'package:presentation/widgets/character_card_widget.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CharacterBloc>().add(LoadCharactersEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        centerTitle: true,
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            final characters = state.characters;

            return ListView.separated(
              itemBuilder: (context, index) {
                return CharacterCard(character: characters[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: characters.length,
            );
          } else {
            return const Center(child: Text('Что-то пошло не так.'));
          }
        },
      ),
    );
  }
}
