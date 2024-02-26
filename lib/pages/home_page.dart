import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rpg_sheet/boxes.dart';
import 'package:rpg_sheet/custom_widgets.dart/drawer.dart';
import 'package:rpg_sheet/management_mobx/management.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var raceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final management = Management();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    hintText: "Nome",
                                  ),
                                  style: const TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Preencha o campo";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: TextFormField(
                                  controller: ageController,
                                  decoration: const InputDecoration(
                                    hintText: "Idade",
                                  ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 18),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Preencha o campo";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                
                                padding: const EdgeInsets.all(15),
                                child: TextFormField(
                                  controller: raceController,
                                  decoration: const InputDecoration(
                                    hintText: "Raça",
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Preencha o campo";
                                    }
                                    return null;
                                  },
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
                                    if (_formKey.currentState!.validate()) {
                                        management.add(
                                            nameController.text,
                                            ageController.text,
                                            selectedClass,
                                            raceController.text);
                                        nameController.clear();
                                        ageController.clear();
                                        raceController.clear();
                                      
                                    }
                                  },
                                  child: const Text('Add')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            drawer: const DrawerWidget());
      }
    );
  }
}
