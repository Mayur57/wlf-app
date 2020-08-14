import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wlf/res/color.dart';
import 'package:wlf/screens/notifications.dart';
import 'package:wlf/screens/settings.dart';
import 'package:wlf/util/scaler.dart';
import '../res/color.dart';
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
    NotificationScreen(
      key: PageStorageKey('Page2'),
    ),
    ContactUs(
      key: PageStorageKey('Page3'),
    ),
    Settings(
      key: PageStorageKey('Page4'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ),
        _buildBottomNavigation(_selectedIndex),
      ],
    ));
  }

  Widget _buildBottomNavigation(selectedIndex) => Align(
        alignment: FractionalOffset.bottomCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(1.11 * SizeConfig.heightSizeMultiplier),
            topLeft: Radius.circular(1.11 * SizeConfig.heightSizeMultiplier),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25.0,
              sigmaY: 25.0,
            ),
            child: Opacity(
              opacity: 0.5,
              child: BottomNavigationBar(
                onTap: (int index) => setState(() => _selectedIndex = index),
                currentIndex: selectedIndex,
                iconSize: 3.11 * SizeConfig.heightSizeMultiplier,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                backgroundColor: Colors.white,
                showUnselectedLabels: true,
                selectedFontSize: 1.78 * SizeConfig.heightSizeMultiplier,
                selectedItemColor: mainColor,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text(
                      'Blogs',
                      style: TextStyle(fontFamily: 'NHGTX'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    title: Text(
                      'Notifications',
                      style: TextStyle(fontFamily: 'NHGTX'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text(
                      'Contact Us',
                      style: TextStyle(fontFamily: 'NHGTX'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text(
                      'Settings',
                      style: TextStyle(fontFamily: 'NHGTX'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
