import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:wlf/res/color.dart';
import 'package:wlf/res/strings.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);
  @override
  State createState() {
    return SettingsState();
  }
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableTheme(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: wlfGraphite,
                boxShadow: [
                  BoxShadow(
                    color: wlfGraphite.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        loginPageLogoImageWhite,
                        height: 60,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'NHGTX',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 70,
                child: Card(
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.brightness_6),
                          Text(
                            "Dark Mode",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Switch(
                        value: true,
                        onChanged: (toggleVar) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AboutUs(),
            Developers(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 70,
                child: Card(
                  color: Colors.green,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.brightness_6),
                      Text(
                        "Log out of the app",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Developers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildList() {
      return Column(
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: Container(
              height: 200,
            ),
          ),
          Card(
            color: Colors.green,
            child: Container(
              height: 200,
            ),
          ),
          Card(
            color: Colors.red,
            child: Container(
              height: 200,
            ),
          ),
        ],
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: false,
                  ),
                  header: Container(
                    height: 70,
                    color: Colors.indigoAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Icon(Icons.code),
                              Text(
                                "Meet the Developers!",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          ExpandableIcon(
                            theme: const ExpandableThemeData(
                              expandIcon: Icons.keyboard_arrow_down,
                              collapseIcon: Icons.keyboard_arrow_up,
                              iconColor: Colors.white,
                              iconSize: 28.0,
                              iconRotationAngle: math.pi,
                              iconPadding: EdgeInsets.only(right: 5),
                              hasIcon: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  expanded: buildList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildList() {
      return Column(
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: Container(
              height: 200,
            ),
          ),
          Card(
            color: Colors.green,
            child: Container(
              height: 200,
            ),
          ),
          Card(
            color: Colors.red,
            child: Container(
              height: 200,
            ),
          ),
        ],
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: false,
                  ),
                  header: Container(
                    height: 70,
                    color: Colors.indigoAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Icon(Icons.code),
                              Text(
                                "About Us",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          ExpandableIcon(
                            theme: const ExpandableThemeData(
                              expandIcon: Icons.keyboard_arrow_down,
                              collapseIcon: Icons.keyboard_arrow_up,
                              iconColor: Colors.white,
                              iconSize: 28.0,
                              iconRotationAngle: math.pi,
                              iconPadding: EdgeInsets.only(right: 5),
                              hasIcon: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  expanded: buildList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
