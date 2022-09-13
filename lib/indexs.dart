import 'package:flutter/material.dart';

class Indexs extends ChangeNotifier{
  Indexs? _indexs;

  Indexs get instance {
    _indexs ??= Indexs();

    return _indexs!;
  }

  int _indexRailNavigation = 0;

  int get indexRailNavigation => _indexRailNavigation;

  set indexRailNavigation(int value) {
    _indexRailNavigation = value;
    notifyListeners();
  }
}
