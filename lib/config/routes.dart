import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/util/pageSwitchingHandler.dart';
import 'package:wlf/screens/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/test':
        return MaterialPageRoute(
            builder: (_) => BottomNavigationBarController());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(
            builder: (_) => BottomNavigationBarController());
    }
  }
}

///TODO: To secure the routes add a random number generator and pass the number to the next page
///Validate the key received and proceed otherwise redirect to a warning page
