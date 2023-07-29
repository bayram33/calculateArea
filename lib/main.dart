import "package:app/apptheme.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "homepage.dart";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkMode(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<DarkMode>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: thmode.darkMode ? thmode.light : thmode.dark,
      home: const HomePage(),
    );
  }
}
