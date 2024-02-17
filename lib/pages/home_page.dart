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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Name"),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: ageController,
                  decoration: const InputDecoration(hintText: "age"),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: classController,
                  decoration:
                      const InputDecoration(hintText: "Character Class"),
                ),
              ),
              const SizedBox(
                height: 20,
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
                    });
                  },
                  child: const Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}
