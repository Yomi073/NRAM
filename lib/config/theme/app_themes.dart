import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color pscBlack = Color(0xFF0D1529);
const Color darkBlue = Color(0xFF29235C);
const Color blue = Color(0xFF003400);
const Color lightBlue = Color(0xFF85A2FD);
const Color fuchsia = Color(0xFF974040);
const Color magenta = Color(0xFFF34768);
const Color roofOrange = Color(0xFFFFE88E);
const Color darkYellow = Color(0xFFFDE792);
const Color lightYellow = Color(0xFFFFF0B4);
const Color white = Color(0xFFFFFFFF);
const Color green1 = Color(0xFF409797);
const Color green2 = Color(0xFF47f3d2);

// new theme

const Color backgroundLight = Color(0xFFFAF5E9);
const Color backgroundDark = Color(0xFF001600);
const Color primaryButtonDark = Color(0xFFFFCC00);
const Color primaryTextDark = Color(0xFFFBEBCE);
const Color tableDark = Color(0xFF032B03);
const Color tableSecondDark = Color(0xFF012301);



class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      primaryColor: blue,
      scaffoldBackgroundColor: backgroundLight,
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
            color: backgroundDark),
        displayMedium: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: backgroundDark),
        displaySmall: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: backgroundDark),
        headlineLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: backgroundDark),
        headlineMedium: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: backgroundDark),
        headlineSmall: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: backgroundDark),
        //FOR BUTTONS ON DARK
        titleLarge: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
            color: primaryTextDark),
        titleMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: white),
        titleSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: white),
        //FOR LABELS  ON WHITE
        labelLarge: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: backgroundDark),
        labelMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: backgroundDark),
        labelSmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: backgroundDark),
        //FOR TEXT ON WHITE
        bodyLarge: TextStyle(
            fontSize: 16.0,
            letterSpacing: 0.5,
            fontWeight: FontWeight.normal,
            color: backgroundDark),
        bodyMedium: TextStyle(
            fontSize: 14.0,
            letterSpacing: 0.25,
            fontWeight: FontWeight.normal,
            color: backgroundDark),
        bodySmall: TextStyle(
            fontSize: 12.0,
            letterSpacing: 0.4,
            fontWeight: FontWeight.normal,
            color: backgroundDark),
      ),
      colorScheme: const ColorScheme.light(
        primary: blue,
        secondary: darkYellow,
        onPrimary: lightYellow,
        onSecondary: lightYellow,
        error: fuchsia,
        surfaceVariant: backgroundLight,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      primaryColor: backgroundDark,
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: const AppBarTheme(
        color: darkBlue,
        iconTheme: IconThemeData(color: white),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryButtonDark,
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: tableDark,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
            color: backgroundDark),
          displayMedium: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: primaryTextDark,),
          displaySmall: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: primaryTextDark),
        labelLarge: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,),
        bodyLarge: TextStyle(color: lightYellow),
      ),
      colorScheme: const ColorScheme.dark(
        primary: primaryButtonDark,
        secondary: tableDark,
        onPrimary: backgroundDark,
        onSecondary: tableSecondDark,
        error: fuchsia,
        background: tableSecondDark,
        surface: backgroundDark,
        onBackground: white,
        onSurface: primaryTextDark,
        surfaceVariant: backgroundDark,
      ).copyWith(secondary: tableDark),
    );
  }
}
