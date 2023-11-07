import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3f55c6)),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black
    )
  );
}