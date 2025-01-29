import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class ThemesModeData {
  // light mode
  final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Inter",
    primaryColor: kMainColor,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    //primarySwatch: Colors.amber,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kSubMainColor,
      selectionColor: kSelectionColor,
      selectionHandleColor: kSubMainColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: kWhiteColor,
      shadowColor: kShadowColor,
      elevation: 4,
      titleTextStyle: TextStyle(
        color: kBlackColor,
        fontFamily: "Inter",
      ),
      iconTheme: IconThemeData(
        color: kBlackColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //backgroundColor: kDarkRedColor,
        ),
    tabBarTheme: const TabBarTheme(
      labelColor: kBlackColor,
      unselectedLabelColor: kGreyColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: kWhiteColor,
        foregroundColor: kSubMainColor,
        shadowColor: kShadowColor,
        elevation: 4,
      ),
    ),
  );

  // dark mode
  final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Inter",
    primaryColor: kMainColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    //primarySwatch: Colors.amber,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kSubMainColor,
      selectionColor: kSelectionColor,
      selectionHandleColor: kSubMainColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      titleTextStyle: TextStyle(
        color: kWhiteColor,
        fontFamily: "Inter",
      ),
      iconTheme: IconThemeData(
        color: kWhiteColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //backgroundColor: kDarkRedColor,
        ),
    tabBarTheme: const TabBarTheme(
      labelColor: kWhiteColor,
      unselectedLabelColor: kGreyColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: kSubMainColor,
        shadowColor: kShadowColor,
        elevation: 4,
      ),
    ),
  );
}
