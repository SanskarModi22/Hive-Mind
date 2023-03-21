import 'package:flutter/material.dart';

class Palette {
  // Colors
  static const Color primaryColor = Color.fromRGBO(1, 1, 1, 1);
  static const Color secondaryColor = Color.fromRGBO(26, 39, 45, 1);
  static const Color drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static final Color redColor = Colors.red.shade500;
  static final Color blueColor = Colors.blue.shade300;

  static final darkModeAppTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: redColor,
      background: primaryColor,
    ),
    scaffoldBackgroundColor: primaryColor,
    cardColor: secondaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
  );

  static final lightModeAppTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: redColor,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: secondaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
  );
}
