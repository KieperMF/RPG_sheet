import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';

part 'management.g.dart';

class Management = ManagementBase with _$Management;

abstract class ManagementBase with Store {
  @observable
  Box? charactersSheets;

  @observable
  Character? characterSelected;

  @observable
  Character? character;


  @action
  deleteSelected(int index) {
    runInAction(() => charactersSheets!.deleteAt(index));
    
  }


  @action
  add(String name, String race, String age, String characterClass) async{
    runInAction(() async{
      await charactersSheets!.put(
        'key_$name',
        Character(
            name: name,
            age: age,
            characterClass: characterClass,
            race: race));
            //character = charactersSheets.get('key_$name',);
            print(character!.name);
    });
    
  }

  @action
  clear(){
    runInAction(() => charactersSheets!.clear());
  }
}
