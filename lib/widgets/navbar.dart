import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white.withOpacity(0.5),
      currentIndex: _currentIndex,
      iconSize: 36,
      elevation: 40,
      selectedFontSize: 12,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: Text(
            "Blogs",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.supervisor_account,
            color: Colors.white,
          ),
          title: Text(
            "Contact us",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          title: Text(
            "My Account",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          print(_currentIndex);
        });
      },
    );
  }
}
