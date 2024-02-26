import 'package:hive/hive.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';

class CharacterService {  

  Box? box;

  Future<void> init() async {
      box = await Hive.openBox<Character>('charactersheet');
  }

  addBox(String name, String age, String characterClass, String race)  {
     box!.put(
        'key_$name',
        Character(
            name: name, age: age, characterClass: characterClass, race: race));
  }

  void delete(int index) {
    box!.deleteAt(index);
  }

  void clearBox() {
    box!.clear();
  }

   Future<List<Character>>  feedManagement() async{
    List<Character> listCharacters = [];
    int i = 0;
      while (box!.length > i) {
        Character cha = box!.getAt(i);
        listCharacters.add(cha);
        i++;
      }
      return listCharacters;
  }
}
