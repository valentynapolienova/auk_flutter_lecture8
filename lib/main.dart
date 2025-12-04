import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lecture6/ui/home_page.dart';

void main() {
  const apiKey = String.fromEnvironment('OPENWEATHER_API_KEY');
  runApp(MyApp(apiKey: apiKey));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.apiKey, super.key});

  final String apiKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      home: HomePage(apiKey: apiKey),
    );
  }
}
