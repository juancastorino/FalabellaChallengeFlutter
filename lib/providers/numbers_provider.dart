import 'package:flutter/material.dart';

class NumbersProvider extends ChangeNotifier {
  int _start = 1;
  int _end = 100;
  late int _listCountItems;

  Map<int, String> _stringsToReplace = {3: 'Falabella', 5: 'IT'};

  int _replaceNumber1 = 3;
  String _replaceText1 = 'Falabella';
  int _replaceNumber2 = 5;
  String _replaceText2 = 'IT';
  int _commonMultiple = 1;
  String _commonMultipleFoundedText = 'Integraciones';

  setReplaceNumber1(replaceNumber1) => _replaceNumber1 = replaceNumber1;
  setReplaceText1(replaceText1) => _replaceText1 = replaceText1;
  setReplaceNumber2(replaceNumber2) => _replaceNumber2 = replaceNumber2;
  setReplaceText2(replaceText2) => _replaceText2 = replaceText2;
  setCommonMultiple(commonMultiple) => _commonMultiple = commonMultiple;
  setCommonMultipleFoundedText(commonMultipleFoundedText) =>
      _commonMultipleFoundedText = commonMultipleFoundedText;

  void regenerateStringsToReplace() {
    Map<int, String> newStringsToReplace = new Map();
    newStringsToReplace[_replaceNumber1] = _replaceText1;
    newStringsToReplace[_replaceNumber2] = _replaceText2;
    _stringsToReplace = newStringsToReplace;
    updateCommonMultiple();
    _stringsToReplace[_commonMultiple] = _commonMultipleFoundedText;
  }

  void updateCommonMultiple() {
    _commonMultiple = _replaceNumber1 * _replaceNumber2;
  }

  int get getTotalItems => _listCountItems;

  int get getStart => _start;
  setStart(start) => _start = start;

  int get getEnd => _end;
  setEnd(end) => (_end = end);

  dynamic parseList(String type) {
    regenerateStringsToReplace();

    _listCountItems = (_start - _end - 1).abs();
    int inicio = _start;
    final numbersList =
        List<dynamic>.generate(_listCountItems, (i) => inicio++);
    List<dynamic> replacesList = [];

    numbersList.forEach((number) {
      replacesList.add(parseNumber(number));
    });

    if (type == 'numbers') {
      return numbersList;
    } else if (type == 'replaces') {
      return replacesList;
    }
  }

  dynamic parseNumber(int number) {
    dynamic resultAfterReplace = number;
    _stringsToReplace.forEach((key, value) {
      if (number % key == 0) {
        resultAfterReplace = value;
      }
    });

    return resultAfterReplace;
  }
}
