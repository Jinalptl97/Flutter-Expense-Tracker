import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var KcolorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

var kDarkColorTheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark()
          .copyWith(useMaterial3: true, colorScheme: kDarkColorTheme),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: KcolorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: KcolorScheme.onPrimaryContainer,
            foregroundColor: KcolorScheme.primaryContainer,
          ),
          cardTheme: CardTheme().copyWith(
            color: KcolorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: KcolorScheme.primaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: KcolorScheme.onSecondaryContainer,
                  fontSize: 16))),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
