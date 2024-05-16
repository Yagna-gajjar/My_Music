import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_music/screens/splash_screen.dart';

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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('hi', 'IN'),
        Locale('gu', 'IN')
      ],
      theme: ThemeData(
        textTheme: GoogleFonts.tiroDevanagariHindiTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0CC0DF)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
