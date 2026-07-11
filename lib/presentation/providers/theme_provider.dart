import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = true;
  ThemeMode appTheme = ThemeMode.dark;

  void changeTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = !isDarkMode;
    appTheme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    await prefs.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }

  Future<void> isDark() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? true;
    appTheme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
