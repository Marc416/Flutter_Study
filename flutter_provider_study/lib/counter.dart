import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier,hoho{
  int _count = 0; //_<- 이거 넣으면 private이라는 뜻임
  int getCount()=> _count;

  void incrementCount(){
    _count++;
    notifyListeners();
    cooking();
  }
}

class hoho{
  void cooking(){

  }
}