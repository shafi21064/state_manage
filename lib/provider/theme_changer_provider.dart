import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier{

  bool _isDark = false;
  bool get isDark => _isDark;

  void setTheme (bool value){
    _isDark = value;
    notifyListeners();
  }
}