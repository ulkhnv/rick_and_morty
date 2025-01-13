import 'package:flutter/material.dart';
import 'package:presentation/model/character_ui_model.dart';

class CharacterDetailBody extends StatelessWidget {
  const CharacterDetailBody({super.key, required this.character});

  final CharacterUIModel character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          character.name,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Image.network(
          character.image,
          width: 260,
          height: 260,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: character.isAlive() ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              character.status,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              maxLines: 1,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        ...buildText('Species:', character.species),
        ...buildText('Last known location:', character.location.name),
        ...buildText('Origin:', character.origin.name),
      ],
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 12,
      ),
    ];
  }
}
