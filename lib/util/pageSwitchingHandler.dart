import 'package:flutter/material.dart';
import 'package:wlf/res/color.dart';
import 'package:wlf/screens/settings.dart';
import '../screens/blog.dart';
import '../screens/contactus.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    BlogPage(
      key: PageStorageKey('Page1'),
    ),
    ContactUs(
      key: PageStorageKey('Page2'),
    ),
    Settings(
      key: PageStorageKey('Page3'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 28,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 16,
        selectedItemColor: accent,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: mainColor,
            icon: Icon(Icons.home),
            title: Text(
              'Blogs',
              style: TextStyle(fontFamily: 'NHGTX'),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: wlfCoral,
            icon: Icon(Icons.person),
            title: Text(
              'Contact Us',
              style: TextStyle(fontFamily: 'NHGTX'),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: wlfGraphite,
            icon: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(fontFamily: 'NHGTX'),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
