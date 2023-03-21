import 'package:flutter/material.dart';

class Palette {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  static final darkModeAppTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: redColor,
      background: drawerColor,
    ),
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
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
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
  );
}
