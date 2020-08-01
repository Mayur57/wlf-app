import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wlf/res/color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AppBar(
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 16,),
                    Text(
                      'Notifications',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'NHGTXM',
                          color: Colors.white),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
