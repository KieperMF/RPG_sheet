import 'package:flutter/material.dart';
import 'package:rpg_sheet/boxes.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';
import 'package:rpg_sheet/pages/character_page.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey[300],
        width: 350,
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                "Selecione a Ficha",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: charactersSheets.length,
              itemBuilder: (context, index) {
                Character character = charactersSheets.getAt(index);
                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 90,
                          child: Text(
                            character.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            character.characterClass,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                              onPressed: () {
                                characterSelected =
                                    charactersSheets.getAt(index);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CharacterPage()));
                              },
                              icon: const Icon(
                                Icons.pageview_rounded,
                                size: 40,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                              onPressed: () {
                                charactersSheets.deleteAt(index);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.clear,
                                size: 40,
                              )),
                        ),
                      ],
                    ));
              },
            ),
            if (charactersSheets.isEmpty) ...[
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Nenhuma Ficha foi Encontrada",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ]
          ],
        )));
  }
}
