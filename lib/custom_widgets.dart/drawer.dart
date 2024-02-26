import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rpg_sheet/boxes.dart';
import 'package:rpg_sheet/custom_widgets.dart/alert.dart';
import 'package:rpg_sheet/management_mobx/management.dart';
import 'package:rpg_sheet/pages/character_page.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final management = Management();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Drawer(
          backgroundColor: Colors.grey[300],
          width: 350,
          child: SingleChildScrollView(
              child: Column(
            children: [
              if (management.charactersSheets.isEmpty) ...[
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Nenhuma Ficha foi Encontrada",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ] else if (management.charactersSheets.isNotEmpty) ...[
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
                  itemCount: management.charactersSheets.length,
                  itemBuilder: (context, index) {
                    management.character =
                        management.charactersSheets.elementAt(index);
                    return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 90,
                                child: Text(
                                  management.character!.name,
                                  style: const TextStyle(fontSize: 18),
                                )),
                            SizedBox(
                                width: 100,
                                child: Text(
                                  management.character!.characterClass,
                                  style: const TextStyle(fontSize: 18),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                  onPressed: () {
                                    characterSelected = management
                                        .charactersSheets
                                        .elementAt(index);
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
                                    management.deleteSelected(index);
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
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black,
                  child: IconButton(
                    tooltip: 'Deletar Todos',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertCustom();
                          });
                    },
                    icon: const Icon(Icons.clear_rounded, color: Colors.white),
                    iconSize: 40,
                  ),
                ),
              ],
            ],
          )));
    });
  }
}
