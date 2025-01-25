import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  // save the last theme preference in shared preferences
  late SharedPreferences storage;

  // Updated dark theme
  final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF181A1F),
    primaryColor: const Color(0xFF1E1E2C),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E2C),
      elevation: 0,
      titleTextStyle: TextStyle(color: Color(0xFFE0E0E0), fontSize: 20),
      iconTheme: IconThemeData(color: Color(0xFFE0E0E0)),
    ),
    cardColor: const Color(0xFF242634),
    dividerColor: const Color(0xFF393D4B),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
      bodyMedium: TextStyle(color: Color(0xFFB0B0B0)),
      headlineMedium:
          TextStyle(color: Color(0xFFF5F5F5), fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF8E97FD),
      foregroundColor: Colors.white,
    ),
  );

  // Custom light theme
  final lightTheme = ThemeData.light();

  changeTheme() {
    _isDark = !_isDark;
    storage.setBool("isDark", _isDark);
    notifyListeners();
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}
