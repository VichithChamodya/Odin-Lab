import 'package:flutter/material.dart';
import 'package:odinlab/services/theme_persistance.dart';
import 'package:odinlab/utils/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemesModeData().lightMode;

  ThemeProvider() {
    _loadTheme();
  }

  final ThemePersistance _themePersistance = ThemePersistance();

  // getter
  ThemeData get getThemeData => _themeData;

  bool get isDarkMode => _themeData.brightness == Brightness.dark;

  // setter
  set setThemeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  // load the theme from shared preferences
  Future<void> _loadTheme() async {
    bool isDark = await _themePersistance.loadTheme();
    setThemeData =
        isDark ? ThemesModeData().darkMode : ThemesModeData().lightMode;
  }

  // toggle theme
  Future<void> toggleTheme(bool isDark) async {
    setThemeData =
        isDark ? ThemesModeData().darkMode : ThemesModeData().lightMode;

    await _themePersistance.storeTheme(isDark);
    notifyListeners();
  }
}
