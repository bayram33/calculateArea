
import 'package:flutter/material.dart';

class DarkMode with ChangeNotifier {
  bool darkMode = true;
  

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.yellow,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800),
      ),
    ),
  );

  changemode() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
