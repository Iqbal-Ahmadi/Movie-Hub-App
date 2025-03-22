import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/constants/my_app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider(){
    loadTheme();
  }
  ThemeData _themeMode = MyThemeData.lightTheme;

  ThemeData get themeData => _themeMode;
  String themeKey = 'isDarkMode';

  Future<void> loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool(themeKey) ?? false;
    _themeMode = isDarkMode ? MyThemeData.darkTheme : MyThemeData.lightTheme;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeMode = _themeMode == MyThemeData.darkTheme
        ? MyThemeData.lightTheme
        : MyThemeData.darkTheme;
    await prefs.setBool(themeKey, _themeMode == MyThemeData.darkTheme);
    notifyListeners();
  }
}
