import 'package:flutter/material.dart';

final themeApp = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
    buttonTheme: const ButtonThemeData(),
    iconTheme: const IconThemeData(size: 30, color: Colors.white),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(size: 30, color: Colors.white),
        color: Colors.purpleAccent),
    textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(
            color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)));
