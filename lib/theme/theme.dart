import 'package:flutter/material.dart';

class SpectralTheme {
  static const Color red = Color(0xFFD53E4F);
  static const Color orange = Color(0xFFFC8D59);
  static const Color yellow = Color(0xFFFEE08B);
  static const Color green = Color(0xFF99D594);
  static const Color blue = Color(0xFF3288BD);
  static const Color purple = Color(0xFF5E4FA2);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: red,
      secondary: orange,
      tertiary: purple,
      surface: Colors.white,
      background: const Color(0xFFFAFAFA),
      error: red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: const Color(0xFF1A1A1A),
      onBackground: const Color(0xFF1A1A1A),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: red,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: purple,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(
        color: green
      ),
      labelSmall: TextStyle(
        color: green
      ),
      labelMedium: TextStyle(
        color: green
      ),
      bodyLarge: TextStyle(
        color: green
      ),
      
    )
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: red,
      secondary: orange,
      tertiary: purple,
      surface: const Color(0xFF1A1A24),
      background: const Color(0xFF0F0F14),
      error: red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: const Color(0xFFE8E8E8),
      onBackground: const Color(0xFFE8E8E8),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1A24),
      foregroundColor: Color(0xFFE8E8E8),
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1A1A24),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(
        color: green
      ),
      labelSmall: TextStyle(
        color: green
      ),
      labelMedium: TextStyle(
        color: green
      ),
      bodySmall: TextStyle(
        color: green
      ),
      
    )
  );
}
