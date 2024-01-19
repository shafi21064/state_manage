import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier{

  int _count = 00;
  int get count => _count;

  void setCounter (){
    _count ++;
    notifyListeners();

  }

}