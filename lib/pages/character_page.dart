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
        backgroundColor: Colors.grey[300],
      ),
      body: Center(
        child: Row(children: [
          Container(
            color: Colors.black,
            width: 100,
            child: const Column(
              children: [
                Text(
                  "Atributos",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.lime[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Nome: ${characterSelected.name}', style:const TextStyle(fontSize: 18),),
                Text('Classe: ${characterSelected.characterClass}', style:const TextStyle(fontSize: 18),),
                Text('Raça: ${characterSelected.race}', style:const TextStyle(fontSize: 18),),
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
