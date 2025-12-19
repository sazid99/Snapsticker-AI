import 'package:flutter/material.dart';

class AppTheme {
  //note: light theme
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(fixedSize: Size(double.maxFinite, 50)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(fixedSize: Size(double.maxFinite, 50)),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.black54,
        backgroundColor: Colors.black12,
      ),
    ),
  );

  //note: dark theme
  static final ThemeData
  darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(fixedSize: Size(double.maxFinite, 50)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(fixedSize: Size(double.maxFinite, 50)),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white10,
      ),
    ),
  );
}
