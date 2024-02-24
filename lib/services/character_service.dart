import 'package:hive/hive.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';

class CharacterService{
  Box? _box;
  CharacterService(){
    _init();
  }

  void _init() async{
    _box = await Hive.openBox<Character>('charactersheet');
  }


  Future<Character> add(String name, String race, String age, String characterClass) async{
    await _box!.put(
        'key_$name',
        Character(
            name: name, age: age, characterClass: characterClass, race: race));
    return _box!.get('key_$name');
  }
}