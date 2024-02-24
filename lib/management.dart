import 'package:mobx/mobx.dart';
import 'package:rpg_sheet/model_hive/character_model.dart';
import 'package:rpg_sheet/services/character_service.dart';

part 'management.g.dart';

class Management = ManagementBase with _$Management;

abstract class ManagementBase with Store {
  final _characterService = CharacterService();

  @observable
  ObservableList<Character> charactersSheets = ObservableList.of([]);

  @observable
  Character? characterSelected;

  @observable
  Character? character;

  @action
  deleteSelected(int index) {
    //_characterService.(index);
  }

  @action
  add(String name, String race, String age, String characterClass) async{
     final result = await _characterService.add(name, race, age, characterClass);
     charactersSheets.add(result);
  }

  @action
  clear() {
    charactersSheets.clear();
  }
}
