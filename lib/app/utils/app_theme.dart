import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: ColorsUtil.brandColor,
          letterSpacing: 0.02
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        letterSpacing: 0.01,

      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.01,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.02,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      displaySmall : GoogleFonts.roboto(
        fontSize: 12,
        color: Colors.white.withOpacity(0.6499999761581421),
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(ColorsUtil.brandColor),
        foregroundColor: MaterialStateProperty.all(ColorsUtil.brandWhite),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 14),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0x192B447C),
      hintStyle: TextStyle(fontSize: 14),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none),
    ),

    textButtonTheme: TextButtonThemeData(style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)))
  );
}
