// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Management on ManagementBase, Store {
  late final _$charactersSheetsAtom =
      Atom(name: 'ManagementBase.charactersSheets', context: context);

  @override
  ObservableList<Character> get charactersSheets {
    _$charactersSheetsAtom.reportRead();
    return super.charactersSheets;
  }

  @override
  set charactersSheets(ObservableList<Character> value) {
    _$charactersSheetsAtom.reportWrite(value, super.charactersSheets, () {
      super.charactersSheets = value;
    });
  }

  late final _$characterSelectedAtom =
      Atom(name: 'ManagementBase.characterSelected', context: context);

  @override
  Character? get characterSelected {
    _$characterSelectedAtom.reportRead();
    return super.characterSelected;
  }

  @override
  set characterSelected(Character? value) {
    _$characterSelectedAtom.reportWrite(value, super.characterSelected, () {
      super.characterSelected = value;
    });
  }

  late final _$characterAtom =
      Atom(name: 'ManagementBase.character', context: context);

  @override
  Character? get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(Character? value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  late final _$ManagementBaseActionController =
      ActionController(name: 'ManagementBase', context: context);

  @override
  dynamic deleteSelected(int index) {
    final _$actionInfo = _$ManagementBaseActionController.startAction(
        name: 'ManagementBase.deleteSelected');
    try {
      return super.deleteSelected(index);
    } finally {
      _$ManagementBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic add(String name, String age, String characterClass, String race) {
    final _$actionInfo = _$ManagementBaseActionController.startAction(
        name: 'ManagementBase.add');
    try {
      return super.add(name, age, characterClass, race);
    } finally {
      _$ManagementBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clear() {
    final _$actionInfo = _$ManagementBaseActionController.startAction(
        name: 'ManagementBase.clear');
    try {
      return super.clear();
    } finally {
      _$ManagementBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
charactersSheets: ${charactersSheets},
characterSelected: ${characterSelected},
character: ${character}
    ''';
  }
}
