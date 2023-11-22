import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:harrypotter/provider_data/hogwarts_data.dart';
import 'package:harrypotter/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HogwartsData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple.shade200,
            centerTitle: true
          )
        ),
        home: const HomePage(),
      ),
    );
  }
}
