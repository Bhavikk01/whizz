import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.atkinsonHyperlegible(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: ColorsUtil.darkTextColor,
      ),
      titleMedium: GoogleFonts.atkinsonHyperlegible(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.atkinsonHyperlegible(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.atkinsonHyperlegible(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.atkinsonHyperlegible(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(ColorsUtil.blueColor),
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
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ColorsUtil.blueColor,
          width: 2,
        ),
      ),
      filled: true,
      fillColor: ColorsUtil.textFieldColor,
      hintStyle: GoogleFonts.atkinsonHyperlegible(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ColorsUtil.blueColor,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: ColorsUtil.textFieldColor,
        hintStyle: GoogleFonts.atkinsonHyperlegible(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    )
  );
}
