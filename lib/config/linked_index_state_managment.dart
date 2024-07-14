import 'package:flutter/material.dart';

class LinkedIndexStateManagement extends ChangeNotifier{
  int index =0;
  changeIndex(int newIndex){
    if(index == newIndex) {
      return;
    }index =newIndex;
    notifyListeners();
  }
}