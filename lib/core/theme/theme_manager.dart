import 'package:flutter/material.dart';

import 'color_palette.dart';

abstract class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: ColorPalette.primaryColor),
    ),
    primaryColor: ColorPalette.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'janna',
        fontSize: 12,
      ),
      showUnselectedLabels: false,
      unselectedItemColor: Colors.black,

      backgroundColor: ColorPalette.primaryColor,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'janna',
        fontWeight: FontWeight.w700,
        color: Color(0xffFEFFE8),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'janna',
        fontWeight: FontWeight.w700,
        color: Color(0xffFEFFE8),
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: 'janna',
        fontWeight: FontWeight.w700,
        color: Color(0xffFEFFE8),
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontFamily: 'janna',
        fontWeight: FontWeight.bold,
        color: Color(0xff202020),
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontFamily: 'janna',
        fontWeight: FontWeight.bold,
        color: Color(0xffFEFFE8),
      ),
      headlineLarge: TextStyle(
        fontSize: 36,
        fontFamily: 'janna',
        fontWeight: FontWeight.bold,
        color: Color(0xffFEFFE8),
      ),
    ),
  );
}
