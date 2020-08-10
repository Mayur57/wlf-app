import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wlf/main.dart';
import 'package:wlf/res/color.dart';
import 'package:wlf/screens/PersonalNotifications.dart';
import 'package:wlf/screens/PublicNotifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;
  //String user_id;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _tabController = new TabController(vsync: this, length: 2);
    //UserId();
  }
  /*
  Future<void> UserId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_id = prefs.getString('user_uid');
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print(user_id);
  }
  */

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(top: 11.0),
              sliver: new SliverAppBar(
                title: new Text(
                  'Notifications',
                  style: TextStyle(
                      fontSize: 40, fontFamily: 'NHGTXM', color: mainColor),
                ),
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                titleSpacing: 16,
                bottom: new TabBar(
                  tabs: <Tab>[
                    new Tab(
                      text: "Personal",
                      icon: new Icon(Icons.person_outline),
                    ),
                    new Tab(
                      text: "Public",
                      icon: new Icon(Icons.public),
                    ),
                  ],
                  controller: _tabController,
                  labelColor: mainColor,
                  unselectedLabelColor: Colors.blue,
                  indicatorColor: mainColor,
                ),
              ),
            )
          ];
        },
        body: new TabBarView(
          children: <Widget>[
            new PersonalNotifications(user_id),
            new PublicNotifications(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
