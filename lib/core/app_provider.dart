import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  int _technicians = 1;

  int get technicians => _technicians;

  addTechnicians () {
    _technicians ++;
    notifyListeners();
  }

}