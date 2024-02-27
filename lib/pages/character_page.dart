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
        child: Row(children: [
          const Column(
            children: [],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Nome: ${characterSelected.name}'),
              Text('Classe: ${characterSelected.characterClass}'),
              Text('Raça: ${characterSelected.race}'),
            ],
          )
        ]),
      ),
    );
  }
}
