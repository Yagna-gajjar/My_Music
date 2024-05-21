import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_music/l10n/l10n.dart';
import 'package:my_music/screens/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_music/utils/Controllers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {

  Locale? _locale;
  Future<void> setLocale(Locale locale) async {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    getLocal();
  }

  Future<void> getLocal() async {
    String? result = await Controllers.StringGet(key: 'lan') ?? 'en';
    setLocale(Locale(result));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      locale: _locale,
      supportedLocales: L10n.all,
      theme: ThemeData(
        textTheme: GoogleFonts.tiroDevanagariHindiTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0CC0DF)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
