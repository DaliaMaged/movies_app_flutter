import 'package:flutter/material.dart';

class MoviesAppTheme{
  static Color whiteColor = Color(0xffFFFFFF);
  static Color lightGreyColor_text = Color(0xffB5B4B4);
  static Color lightGreyColor_contentText = Color(0xffCBCBCB);
  static Color lightGreyColor_bottomNav = Color(0xffC6C6C6);
  static Color bottomNavGreyColor = Color(0xff1A1A1A);
  static Color musturedColor = Color(0xffF7B539);
  static Color blackColor = Color(0xff000000);
  static Color darkGreyColor = Color(0xff282A28);
  static ThemeData moviesAppTheme = ThemeData(
    canvasColor: bottomNavGreyColor,
    scaffoldBackgroundColor:blackColor ,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize:18,
        color: whiteColor
      ),
      titleMedium: TextStyle(
          fontSize:13,
          color: lightGreyColor_contentText
      ),
      titleSmall: TextStyle(
          fontSize:10,
          color: lightGreyColor_text
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: musturedColor,
      backgroundColor: bottomNavGreyColor,
      selectedLabelStyle: TextStyle(
        fontSize: 8,
      )
    )
  );
}