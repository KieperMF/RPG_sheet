import 'package:hive/hive.dart';

part 'character_model.g.dart';

@HiveType(typeId: 1)
class Character{
  Character({
    required this.name,
    required this.age,
    required this.characterClass,
    required this.race
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String age;

  @HiveField(2)
  String characterClass;

  @HiveField(3)
  String race;
}