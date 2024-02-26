import 'package:mobx/mobx.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';
import 'package:rpg_sheet/services/character_service.dart';

part 'management.g.dart';

class Management = ManagementBase with _$Management;

abstract class ManagementBase with Store {
  ManagementBase(){
    init();
  }

  final _characterService = CharacterService();

  Future<void> init() async{
    Future.delayed(const Duration(microseconds: 1000),() async {
      charactersSheets.addAll(await _characterService.feedManagement());
    });
    
  }

  @observable
  ObservableList<Character> charactersSheets = ObservableList.of([]);

  @observable
  Character? characterSelected;

  @observable
  Character? character;
  
  @action
  deleteSelected(int index) {
    _characterService.delete(index);
    charactersSheets.removeAt(index);
  }

  @action
  add(String name, String age, String characterClass, String race){
    _characterService.addBox(name,age, characterClass,race);
     charactersSheets.add(Character(name: name, age: age, characterClass: characterClass, race: race));
  }

  @action
  clear() {
    _characterService.clearBox();
    charactersSheets.clear();
  }
}
