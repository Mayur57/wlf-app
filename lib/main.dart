import 'package:flutter/material.dart';
import 'package:wlf/util/scaler.dart';
import 'package:wlf/screens/blog.dart';

import 'config/routes.dart';


void main() => runApp(MyApp());

Color bg = Color(0xFF062D4C);

//Introduction page
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          return OrientationBuilder(
              builder: (context, orientation){
                SizeConfig().initScaler(constraints, orientation);
                return MaterialApp(
//                  home: ErrorPage(),
                  initialRoute: '/home',
                  onGenerateRoute: RouteGenerator.generateRoute,
                  debugShowCheckedModeBanner: false,
                );
              }
          );
        }
    );
  }
}