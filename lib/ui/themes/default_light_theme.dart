import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultLightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    primaryContainer: Color(0xFFFFFFFF),
    primary: Color(0xFFFA7C2E),
    secondary: Color(0xFFFA7C2E),
    surface: Color(0xFFFFFFFF),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFF000000),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.climateCrisis(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: const Color(0xFFFF8C42),
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF000000),
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF000000),
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF000000),
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF000000),
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF000000),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.all<double>(0),
      backgroundColor: WidgetStateProperty.all<Color?>(const Color(0xFFFA7C2E)),
      foregroundColor: WidgetStateProperty.all<Color>(const Color(0xFFFFFFFF)),
      textStyle: WidgetStateProperty.all<TextStyle>(GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      )),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color?>(const Color(0x00FFFFFF)),
    foregroundColor: WidgetStateProperty.all<Color?>(const Color(0xFFFA7C2E)),
    shape: WidgetStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    )),
    side: WidgetStateProperty.all(
      const BorderSide(
        color: Color(0xFFFA7C2E),
        width: 2,
      ),
    ),
    textStyle: WidgetStateProperty.all(GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    )),
  )),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color?>(const Color(0x00FFFFFF)),
      foregroundColor: WidgetStateProperty.all<Color?>(const Color(0xFFFA7C2E)),
      textStyle: WidgetStateProperty.all<TextStyle>(GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      )),
    ),
  ),
);
