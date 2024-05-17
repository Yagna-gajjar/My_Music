import 'package:flutter/material.dart';
import 'package:my_music/screens/HomePage.dart';
import 'package:my_music/screens/LibrabyPage.dart';
import 'package:my_music/screens/SearchPage.dart';
import 'package:my_music/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' ;

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    Library()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.2],
              colors: [AppColors.primaryColor, AppColors.secondaryColor])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: _widgetOptions.elementAt(selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search_rounded),
              label: AppLocalizations.of(context)!.explore,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.folder_open_sharp),
              activeIcon: Icon(Icons.folder),
              label: AppLocalizations.of(context)!.library,
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color(0xff0CC0DF),
        ),
      ),
    );
  }
}