import 'package:flutter/material.dart';
import 'package:rpg_sheet/boxes.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ficha do Personagem'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(characterSelected.name!),
            Text(characterSelected.characterClass!),
            Text(characterSelected.race!)
            ],
        ),
      ),
    );
  }
}
