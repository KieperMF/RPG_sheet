import 'package:flutter/material.dart';
import 'package:rpg_sheet/boxes.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criação de Personagem'),
      ),
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: "Nome",
                          ),
                          autofocus: true,
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
                          child: DropdownButton<String>(
                              value: selectedClass,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedClass = newValue!;
                                });
                              },
                              items: classes.map<DropdownMenuItem<String>>((String classe) {
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
                                      characterClass: selectedClass));
                              nameController.clear();
                              ageController.clear();
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
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: charactersSheets.length,
                            itemBuilder: (context, index) {
                              Character character = charactersSheets.getAt(index);
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
                                charactersSheets.clear();
                              });
                            },
                            icon: const Icon(Icons.clear_rounded,
                                color: Colors.white),
                            iconSize: 40, ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
