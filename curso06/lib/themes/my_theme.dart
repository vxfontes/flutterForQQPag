import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData MyTheme = ThemeData(
  primarySwatch: ThemeColors.primaryColor, // usamos os dois para a cor primaria
  primaryColor: ThemeColors.primaryColor,
  brightness: Brightness.dark, // escolher um tema para uso
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      )),
);
