import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFF8C42),
    primaryColorLight: const Color(0xFFFA7C2E),
    primaryColorDark: const Color(0xFFFA7C2E),
    canvasColor: const Color(0xFFFFFFFF),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    cardColor: const Color(0xFFFFFFFF),
    dividerColor: const Color(0xFFBDBDBD),
    focusColor: const Color(0xFFFA7C2E),
    hoverColor: const Color(0xFFFA7C2E),
    highlightColor: const Color(0xFFFA7C2E),
    splashColor: const Color(0xFFFA7C2E),
    unselectedWidgetColor: const Color(0xFF000000),
    disabledColor: const Color(0xFFFA7C2E),
    secondaryHeaderColor: const Color(0xFFFA7C2E),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xFFFA7C2E),
      cursorColor: Color(0xFFFA7C2E),
      selectionHandleColor: Color(0xFFFA7C2E),
    ),
    dialogBackgroundColor: const Color(0xFFFFFFFF),
    indicatorColor: const Color(0xFFFA7C2E),
    hintColor: const Color(0xFFFA7C2E),
    toggleButtonsTheme: const ToggleButtonsThemeData(
      color: Color(0xFFFA7C2E),
      selectedColor: Color(0xFFFA7C2E),
      fillColor: Color(0xFFFA7C2E),
      focusColor: Color(0xFFFA7C2E),
      highlightColor: Color(0xFFFA7C2E),
      hoverColor: Color(0xFFFA7C2E),
      splashColor: Color(0xFFFA7C2E),
      borderColor: Color(0xFFFA7C2E),
      selectedBorderColor: Color(0xFFFA7C2E),
    ),
    colorScheme: const ColorScheme(
      primary: Color(0xFFFF8C42),
      secondary: Color(0xFFFA7C2E),
      surface: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      error: Color(0xFFA23E48),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF000000),
      onBackground: Color(0xFF000000),
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
        backgroundColor:
            WidgetStateProperty.all<Color?>(const Color(0xFFFA7C2E)),
        foregroundColor:
            WidgetStateProperty.all<Color>(const Color(0xFFFFFFFF)),
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
    )));
