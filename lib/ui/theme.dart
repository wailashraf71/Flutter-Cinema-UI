import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//ThemeData mainThemeDark1() {
//  return ThemeData(
//    brightness: Brightness.dark,
//    primaryColor: Colors.black,
//    accentColor: Colors.white,
//    fontFamily: 'Roboto',
//    primarySwatch: Colors.red,
//    appBarTheme: AppBarTheme(
//        brightness: Brightness.dark,
//        color: Colors.black38,
//        textTheme: TextTheme(title: TextStyle(color: Colors.white)),
//        iconTheme: IconThemeData(color: Colors.white),
//        actionsIconTheme: IconThemeData(color: Colors.white)),
//  );
//}

const colorWhite =  const Color(0xFFFFFFFF);

const color0 =  const Color(0xFF001121);
const color1 =  const Color(0xFF1e1f28);
const color2 =  const Color(0xFF2c3e50);
const color21 =  const Color(0xFF30323d);
const color22 =  const Color(0xFF2b2d38);
const color3 =  const Color(0xFF262833);
const color5 =  const Color(0xFF36C7D0);
const color51 =  const Color(0xFF57ACDC);
const color52 =  const Color(0xFFE5131E);
const color53 =  const Color(0xFFd7385e);
const color6 =  const Color(0xFFB6C6D5);
const color7 =  const Color(0xFFB0B3B8);

ThemeData mainThemeDark() {

  return ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(title: TextStyle(color: colorWhite)),
    primaryColor: color3,
    scaffoldBackgroundColor: color1,
    backgroundColor: color1,
    secondaryHeaderColor: color51,
    bottomAppBarColor: color3,
    accentColor: color53,
    cardColor: color22
  );
}

ThemeData mainThemeLight() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    indicatorColor: Colors.redAccent,
    accentColor: Colors.black,
      textTheme: GoogleFonts.varelaTextTheme(),
    fontFamily: 'Roboto',
    primarySwatch: Colors.red,
    appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: Colors.white,
        textTheme: TextTheme(title: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black)),
  );
}