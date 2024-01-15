import 'package:flutter/material.dart';

const Color pscBlack = Color(0xFF0D1529);
const Color darkBlue = Color(0xFF29235C);
const Color blue = Color(0xFF4E74E0);
const Color lightBlue = Color(0xFF85A2FD);
const Color fuchsia = Color(0xFF974040);
const Color magenta = Color(0xFFF34768);
const Color roofOrange = Color(0xFFFF9577);
const Color darkYellow = Color(0xFFF7B033);
const Color lightYellow = Color(0xFFFFE2B2);
const Color white = Color(0xFFFFFFFF);
const Color green1 = Color(0xFF409797);
const Color green2 = Color(0xFF47f3d2);

class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: blue,
      scaffoldBackgroundColor: lightYellow,
      appBarTheme: const AppBarTheme(
        color: blue,
        iconTheme: IconThemeData(color: white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: lightYellow,
          backgroundColor: blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(double.infinity, 32),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 64.0,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            fontFamily: 'Barlow'),
        displayMedium: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            fontFamily: 'Barlow'),
        displaySmall: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            fontFamily: 'Barlow'),
        headlineLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            fontFamily: 'Barlow'),
        headlineMedium: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            fontFamily: 'Barlow'),
        headlineSmall: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            fontFamily: 'Barlow'),
        //FOR BUTTONS ON DARK
        titleLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: white,
            fontFamily: 'Barlow'),
        titleMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: white,
            fontFamily: 'Barlow'),
        titleSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: white,
            fontFamily: 'Barlow'),
        //FOR LABELS  ON WHITE
        labelLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            fontFamily: 'Barlow'),
        labelMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            fontFamily: 'Barlow'),
        labelSmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            fontFamily: 'Barlow'),
        //FOR TEXT ON WHITE
        bodyLarge: TextStyle(
            fontSize: 16.0,
            letterSpacing: 0.5,
            fontWeight: FontWeight.normal,
            color: blue,
            fontFamily: 'Barlow'),
        bodyMedium: TextStyle(
            fontSize: 14.0,
            letterSpacing: 0.25,
            fontWeight: FontWeight.normal,
            color: blue,
            fontFamily: 'Barlow'),
        bodySmall: TextStyle(
            fontSize: 12.0,
            letterSpacing: 0.4,
            fontWeight: FontWeight.normal,
            color: blue,
            fontFamily: 'Barlow'),
      ),
      colorScheme: const ColorScheme.light(
        primary: blue,
        secondary: magenta,
        onPrimary: white,
        onSecondary: white,
        error: fuchsia,
      ).copyWith(secondary: magenta),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: darkBlue,
      scaffoldBackgroundColor: pscBlack,
      appBarTheme: const AppBarTheme(
        color: darkBlue,
        iconTheme: IconThemeData(color: white),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: darkBlue,
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: roofOrange,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: white),
        bodyLarge: TextStyle(color: lightYellow),
      ),
      colorScheme: const ColorScheme.dark(
        primary: darkBlue,
        secondary: roofOrange,
        onPrimary: white,
        onSecondary: white,
        error: fuchsia,
        background: pscBlack,
        surface: darkBlue,
        onBackground: white,
        onSurface: white,
      ).copyWith(secondary: roofOrange),
    );
  }
}
