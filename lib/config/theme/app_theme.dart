import 'package:flutter/material.dart';

const seedColor = Color.fromARGB(255, 5, 119, 9);

class AppTheme {
  final bool isDarkMode;

  AppTheme({required this.isDarkMode});

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: seedColor,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        listTileTheme: const ListTileThemeData(
          iconColor: seedColor,
        ),
      );
}
