import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier{
  List<int> _favorite = [];
  List<int> get favorite => _favorite;

  void addItem(int value){
    _favorite.add(value);
    notifyListeners();
  }
  void removeItem(int value){
    _favorite.remove(value);
    notifyListeners();
  }
}