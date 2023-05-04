import 'package:flutter/material.dart'
    show Brightness, ColorScheme, ThemeData, Color;

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFB46060),
    brightness: Brightness.light,
  ),
);
