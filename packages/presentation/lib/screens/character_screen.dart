import 'package:flutter/material.dart';
import 'package:presentation/bloc/bloc_screen.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screens/character_bloc.dart';
import 'package:presentation/screens/character_tile.dart';
import 'package:presentation/widgets/character_card_widget.dart';

class CharacterScreen extends BlocScreen {
  const CharacterScreen({super.key});

  static const ROUTE_NAME = '/CharacterScreen';

  static BasePage page() => BasePage(
        key: UniqueKey(),
        builder: (context) => const CharacterScreen(),
        name: ROUTE_NAME,
        isShowAnim: true,
      );

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState
    extends BlocScreenState<CharacterScreen, CharacterBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: bloc.dataStream,
        builder: (context, snapshot) {
          final tile = snapshot.data;
          if (tile == null || tile.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (tile.data is CharacterTile) {
            final characters = tile.data.characters;
            return ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    bloc.pushCharacterDetailScreen(characters, index);
                  },
                  child: CharacterCard(character: characters[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: characters.length,
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
