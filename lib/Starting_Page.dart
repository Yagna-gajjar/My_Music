import 'dart:async';
import 'package:flutter/material.dart';

class Starting_Page extends StatefulWidget {
  const Starting_Page({super.key});

  @override
  State<Starting_Page> createState() => Starting_PageState();
}

class Starting_PageState extends State<Starting_Page> {
  int _counter = 0;
  @override
  void initState() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_counter == 5) {
          timer.cancel();
          Navigator.pushNamed(context, '/Get_Started');
        } else {
          _counter++;
        }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset('/musium_logo.png')),
    );
  }
}
