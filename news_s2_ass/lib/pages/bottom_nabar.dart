import 'package:flutter/material.dart';
import 'package:news_s2_ass/pages/about_page.dart';
import 'package:news_s2_ass/pages/main_screen.dart';
import 'package:news_s2_ass/pages/setting_page.dart';

class BottomNabar extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<BottomNabar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MainScreen(),
    AboutUsScreen(),
    SettingsScreen(),
   
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'About Us',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}