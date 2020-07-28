import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/screens/blog.dart';
import 'package:wlf/screens/contactus.dart';

import 'package:wlf/screens/content.dart';

import 'package:wlf/screens/error_page.dart';
import 'package:wlf/screens/login.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) =>BlogPage() );

//

//        return MaterialPageRoute(builder: (_) => ContactUs());
      //case '/signupInitial':
      //  return MaterialPageRoute(builder: (_) => ThankyouPage());
      //default:
      //If invalid token is received redirect to page showing error 404
       // return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}

///TODO: To secure the routes add a random number generator and pass the number to the next page
///Validate the key received and proceed otherwise redirect to a warning page
