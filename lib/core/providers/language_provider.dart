import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String language = 'en';

  void changeLanguage() {
    language = language == 'en' ? 'ar' : 'en';
    notifyListeners();
  }
}
