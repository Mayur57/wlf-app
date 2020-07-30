import 'package:flutter/material.dart';
import 'package:wlf/screens/blog.dart';
import 'package:wlf/screens/contactus.dart';

class CustomNavbar extends StatefulWidget {
  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    BlogPage(
      key: PageStorageKey('1'),
    ),
    ContactUs(
      key: PageStorageKey('2'),
    ),
  ];

  _changePage(_currentIndex){
    switch (_currentIndex) {
      case 0:
      Navigator.pushReplacementNamed(context, '/blogs');
      break;
      case 1:
        Navigator.pushReplacementNamed(context, '/contact');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: _currentIndex,
      iconSize: 28,
      selectedFontSize: 16,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          title: Text(
            "Blogs",
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.supervisor_account,
          ),
          title: Text(
            "Contact us",
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          print(_currentIndex);
          _changePage(_currentIndex);
        });
      },
    );
  }
}
