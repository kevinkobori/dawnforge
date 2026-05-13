import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2A48DF);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color foregroundColor = Color(0xFFFFFFFF);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: foregroundColor,
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: primaryColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(primaryColor),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}
