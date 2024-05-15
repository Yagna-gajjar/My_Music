import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_music/screens/Folder.dart';
import 'package:my_music/screens/HomePage.dart';
import 'package:my_music/screens/LibrabyPage.dart';
import 'package:my_music/screens/LogInPage.dart';
import 'package:my_music/screens/SearchPage.dart';
import 'package:my_music/screens/get_started.dart';
import 'package:my_music/screens/splash_screen.dart';
import 'package:my_music/utils/app_colors.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0CC0DF)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    Library()
    // Text('Library Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 1.0],
                colors: [AppColors.primaryColor, AppColors.secondaryColor])
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search_rounded),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.folder_open_sharp),
              activeIcon: Icon(Icons.folder),
              label: 'library',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xff0CC0DF),
        ),
      ),
    );
  }
}