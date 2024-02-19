import 'package:flutter/material.dart';
import 'package:rpg_sheet/boxes.dart';
import 'package:rpg_sheet/custom_widgets.dart/alert.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';
import 'package:rpg_sheet/pages/character_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var raceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Criação de Personagem'),
        ),
        backgroundColor: Colors.grey[700],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.lime[50],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: "Nome",
                            ),
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: ageController,
                            decoration: const InputDecoration(
                              hintText: "Idade",
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: raceController,
                            decoration: const InputDecoration(
                              hintText: "Raça",
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15),
                            child: DropdownButton<String>(
                                value: selectedClass,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedClass = newValue!;
                                  });
                                },
                                items: classes.map<DropdownMenuItem<String>>(
                                    (String classe) {
                                  return DropdownMenuItem<String>(
                                      value: classe,
                                      child: Text(
                                        classe,
                                        style: const TextStyle(fontSize: 18),
                                      ));
                                }).toList())),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                charactersSheets.put(
                                    'key_${nameController.text}',
                                    Character(
                                        name: nameController.text,
                                        age: int.parse(ageController.text),
                                        characterClass: selectedClass,
                                        race: raceController.text));
                                nameController.clear();
                                ageController.clear();
                                raceController.clear();
                              });
                            },
                            child: const Text('Add')),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card(
                          color: Colors.lime.shade50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: charactersSheets.length,
                              itemBuilder: (context, index) {
                                Character character =
                                    charactersSheets.getAt(index);
                                return ListTile(
                                  leading: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          charactersSheets.deleteAt(index);
                                        });
                                      },
                                      icon: const Icon(Icons.remove)),
                                  title: Text(
                                    character.name,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  trailing: Text(
                                    character.characterClass,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: IconButton(
                            tooltip: 'Deletar Todos',
                            onPressed: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertCustom();
                                    });
                              });
                            },
                            icon: const Icon(Icons.clear_rounded,
                                color: Colors.white),
                            iconSize: 40,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
        drawer: Drawer(
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
                      ],
                    ));
              },
            ),
            if (charactersSheets.isNotEmpty) ...[
              SizedBox(
                height: 45,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black,
                  child: IconButton(
                    tooltip: 'Deletar Todos',
                    onPressed: () {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertCustom();
                            });
                      });
                    },
                    icon: const Icon(Icons.clear_rounded, color: Colors.white),
                    iconSize: 30,
                  ),
                ),
              )
            ] else ...[
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Nenhuma Ficha foi Encontrada",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ],
        ))));
  }
}
