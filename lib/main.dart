import 'package:flutter/material.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';
import 'package:rpg_sheet/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'RPG Sheets',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}