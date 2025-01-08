import 'package:flutter/material.dart';
import 'package:presentation/model/character_ui_model.dart';
import 'package:presentation/widgets/character_detail_body_widget.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({
    super.key,
    required this.characters,
    this.index = 0,
  });

  final List<CharacterUIModel> characters;
  final int index;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: index);
    return Scaffold(
      appBar: AppBar(
        title: Text("Character"),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterDetailBody(character: characters[index]);
        },
      ),
    );
  }
}
