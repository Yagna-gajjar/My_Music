import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_music/main.dart';
import 'package:my_music/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyNavigationBar(),)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Image.asset('assets/musium_logo.png'),
      ),
    );
  }
}
