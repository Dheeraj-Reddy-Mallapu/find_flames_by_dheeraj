import 'package:find_flames_by_dheeraj/demo_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFFFF5F8F));
    final darkColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFFFF5F8F), brightness: Brightness.dark);

    final db = DB();

    return MaterialApp(
      title: 'Math Quiz',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      home: MainScreen(db: db),
    );
  }
}
