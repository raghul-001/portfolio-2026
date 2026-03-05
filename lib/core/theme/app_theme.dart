import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protfolio/core/theme/app_pallet.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFFFAFBFF),
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppPallete.hintText),
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppPallete.textfieldBorder, width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppPallete.primaryColor, width: 1.2),
      ),
    ),
  );
}
