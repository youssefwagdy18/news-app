import 'package:flutter/material.dart';

class AppLocalStateManagement extends ChangeNotifier {
  String currentLang = 'en';
  onChangeLang(String newLang) {
    if (currentLang == newLang) {
      return;
    }
    currentLang = newLang;
    notifyListeners();
  }
}
