import 'package:flutter/material.dart';

class SelectedIndex {
  static int selectedIndex = 0;
}

class Bottom extends StatefulWidget {
  const Bottom({super.key});
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  void _onItemTapped(int index) {
    setState(() {
      SelectedIndex.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
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
      currentIndex: SelectedIndex.selectedIndex,
      onTap: _onItemTapped,
      unselectedItemColor: Colors.white,
      selectedItemColor: Color(0xff0CC0DF),
    );
  }
}
