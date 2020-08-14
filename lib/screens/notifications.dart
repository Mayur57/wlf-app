import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wlf/res/color.dart';
import 'package:wlf/screens/PersonalNotifications.dart';
import 'package:wlf/screens/PublicNotifications.dart';
import 'package:wlf/util/scaler.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;
  String user_id;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _tabController = new TabController(vsync: this, length: 2);
    UserId();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  UserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString('user_uid');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new NestedScrollView(
        physics: BouncingScrollPhysics(),
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPadding(
              padding:
                  EdgeInsets.only(top: 1.56 * SizeConfig.heightSizeMultiplier),
              sliver: new SliverAppBar(
                title: new Text(
                  'Notifications',
                  style: TextStyle(
                      fontSize: 3.56 * SizeConfig.heightSizeMultiplier,
                      fontFamily: 'NHGTXM',
                      color: mainColor),
                ),
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                titleSpacing: 1.78 * SizeConfig.heightSizeMultiplier,
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
                  unselectedLabelColor: Colors.grey,
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
