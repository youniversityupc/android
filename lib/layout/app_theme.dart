import 'package:flutter/material.dart';

abstract class AppColorPalette {
  static const primaryColor = Color.fromRGBO(50, 106, 140, 1);
  static const darkerPrimaryColor = Color.fromRGBO(67, 77, 89, 1);
  static const secondaryColor = Color.fromRGBO(242, 227, 179, 1);
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

  static const emerald50 = Color.fromRGBO(236, 253, 245, 1);
  static const emerald100 = Color.fromRGBO(209, 250, 229, 1);
  static const emerald200 = Color.fromRGBO(167, 243, 208, 1);
  static const emerald300 = Color.fromRGBO(110, 231, 183, 1);
  static const emerald400 = Color.fromRGBO(52, 211, 153, 1);
  static const emerald500 = Color.fromRGBO(16, 185, 129, 1);
  static const emerald600 = Color.fromRGBO(5, 150, 105, 1);
  static const emerald700 = Color.fromRGBO(4, 120, 87, 1);
  static const emerald800 = Color.fromRGBO(6, 95, 70, 1);
  static const emerald900 = Color.fromRGBO(6, 78, 59, 1);
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
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
  ),
  typography: Typography.material2021(),
);
