import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = true;
  ThemeMode appTheme = ThemeMode.dark;

  void changeTheme() {
    isDarkMode = !isDarkMode;
    appTheme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool isDark() {
    bool mode;
    appTheme == ThemeMode.dark ? mode = true : mode = false;

    return mode;
  }
}
