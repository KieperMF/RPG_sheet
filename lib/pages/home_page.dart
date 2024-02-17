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
  var classController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Creation'),
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
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: "Name",
                          ),
                          autofocus: true,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: ageController,
                          decoration: const InputDecoration(
                            hintText: "age",
                          ),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: classController,
                          decoration: const InputDecoration(
                            hintText: "Character Class",
                          ),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
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
                                      characterClass: classController.text));
                              nameController.clear();
                              ageController.clear();
                              classController.clear();
                            });
                          },
                          child: const Text('Add')),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
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
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      charactersSheets.clear();
                    });
                  },
                  icon: const Icon(Icons.clear_rounded, color:Colors.white),
                  iconSize: 40),
                  
            ],
          ),
        ),
      ),
    );
  }
}
