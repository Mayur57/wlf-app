import 'package:flutter/material.dart';
import 'package:wlf/screens/blog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatup\' Life Foundation',
      debugShowCheckedModeBanner: false,
      home: BlogPage(),
    );
  }
}
