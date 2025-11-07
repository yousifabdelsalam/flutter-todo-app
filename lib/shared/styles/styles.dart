import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(

  primarySwatch: mainColor,
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Let AppBar color show through, or HexColor('333739')
      statusBarBrightness: Brightness.dark,   // For iOS: LIGHT icons on dark background
      statusBarIconBrightness: Brightness.light, // For Android: LIGHT icons on dark background
    ),
    backgroundColor: HexColor('333739'),
    titleSpacing: 20,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: mainColor,
    elevation: 20,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: mainColor
),
fontFamily: 'Janna',
  iconTheme: IconThemeData(color: Colors.black),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: mainColor,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Let AppBar color show through, or Colors.white
      statusBarBrightness: Brightness.light,  // For iOS: DARK icons on light background
      statusBarIconBrightness: Brightness.dark, // For Android: DARK icons on light background
    ),
    titleSpacing: 20,
    backgroundColor: HexColor('333739'),
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: mainColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: mainColor
  ),
  fontFamily: 'Janna',
  iconTheme: IconThemeData(color: Colors.black),
);