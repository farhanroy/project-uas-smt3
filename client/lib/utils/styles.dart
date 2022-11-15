import 'package:flutter/material.dart';

class Styles {

  static const Color primaryColor = Color(0xFF2A2E5A);

  static ThemeData theme() {
    return ThemeData(
      primaryColor: const Color(0xFF2A2E5A),
      fontFamily: 'Poppins',
      appBarTheme: appBarTheme(),
    );
  }

  static AppBarTheme appBarTheme() {
    return AppBarTheme(
        elevation: 0,
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.w500)
    );
  }

  static ButtonStyle commonButton() {
    return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(fontSize: 16),
        primary: primaryColor,
        padding: const EdgeInsets.symmetric(
            horizontal: 24, vertical: 12));
  }
}
