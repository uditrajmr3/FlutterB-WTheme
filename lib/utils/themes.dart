import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        fontFamily: GoogleFonts.syne().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(),
        primaryColor: blueColor,
        secondaryHeaderColor: Colors.grey[500],
        cardColor: blackColor,
        canvasColor: Colors.grey,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        textTheme: TextTheme(
          displayLarge: TextStyle(backgroundColor: Colors.grey[500]),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(blackColor),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: blackColor,
          selectionColor: purpleColor,
          selectionHandleColor: navyColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.black)));
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
        fontFamily: GoogleFonts.syne().fontFamily,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.grey[100],
        cardColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(backgroundColor: Colors.white60),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: creamColor,
          selectionHandleColor: darkThemeFontColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.white)));
  }

  static Color blackColor = const Color(0xff000000);
  static Color blueColor = const Color(0xff150050);
  static Color navyColor = const Color(0xff3F0071);
  static Color purpleColor = const Color(0xff610094);
  static Color darkThemeFontColor = const Color(0xffd6d5a8);
  static Color creamColor = const Color(0xfff5f5f5);
}
