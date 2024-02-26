import 'package:hive/hive.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';

class CharacterService {  
  CharacterService(){
    _init();
  }

  Box? box;

  Future<void> _init() async {
    Future.delayed(Duration(milliseconds: 500),()async{
      box = await Hive.openBox<Character>('charactersheet');
    });
    
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
      for (int i = 0; i < box!.length; i++) {
        listCharacters.add(box!.getAt(i));
        i++;
      }
      return listCharacters;
  }
}
