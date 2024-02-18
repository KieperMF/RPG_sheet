import 'package:hive/hive.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';

late Box charactersSheets;
late Character characterSelected;
List<String> classes = ["Guerreiro","Mago","Bárbaro","Paladino","Bardo","Bruxo","Druida","Ladino","Clérigo"];
String selectedClass = "Guerreiro";