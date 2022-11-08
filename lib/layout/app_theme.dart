import 'package:flutter/material.dart';

abstract class AppColorPalette {
  static const primaryColor = Color.fromRGBO(50, 106, 140, 1);
  static const backgroundColor = Color.fromRGBO(242, 242, 242, 1);

  static const gray50 = Color.fromRGBO(250, 250, 250, 1);
  static const gray100 = Color.fromRGBO(244, 244, 245, 1);
  static const gray200 = Color.fromRGBO(228, 228, 231, 1);
  static const gray300 = Color.fromRGBO(212, 212, 216, 1);
  static const gray400 = Color.fromRGBO(161, 161, 170, 1);
  static const gray500 = Color.fromRGBO(113, 113, 122, 1);
  static const gray600 = Color.fromRGBO(82, 82, 91, 1);
  static const gray700 = Color.fromRGBO(63, 63, 70, 1);
  static const gray800 = Color.fromRGBO(39, 39, 42, 1);
  static const gray900 = Color.fromRGBO(24, 24, 27, 1);
}

final theme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColorPalette.primaryColor,
  backgroundColor: AppColorPalette.backgroundColor,
  scaffoldBackgroundColor: AppColorPalette.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorPalette.backgroundColor,
    foregroundColor: AppColorPalette.primaryColor,
    elevation: 0,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColorPalette.primaryColor,
    unselectedLabelColor: AppColorPalette.primaryColor,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        width: 2.0,
        color: AppColorPalette.primaryColor,
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColorPalette.backgroundColor,
    selectedItemColor: AppColorPalette.primaryColor,
    unselectedItemColor: AppColorPalette.gray500,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorPalette.primaryColor,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
  typography: Typography.material2021(),
);
