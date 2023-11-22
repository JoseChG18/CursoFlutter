import 'package:fitness_time/screens/home_page.dart';
import 'package:fitness_time/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppStyles.persianPink,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 4
        )
      ),
      home: const HomePage(),
    );
  }
}
