import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:wlf/res/color.dart';
import 'package:wlf/res/strings.dart';
import 'package:wlf/util/scaler.dart';

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
                      'Settings',
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
      body: ExpandableTheme(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            DarkModeToggle(),
            CustomDivider(),
            AboutUs(),
            CustomDivider(),
            Developers(),
            SizedBox(
              height: 20,
            ),
            LogoutButton(),
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
                    height: 60,
                    color: mainColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.code, color: Colors.white,),
                              ),
                              Text(
                                "The Developers",
                                style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'NHGTXM'),
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
                    height: 60,
                    color:mainColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.insert_emoticon, color: Colors.white,),
                              ),
                              Text(
                                "About Us",
                                style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'NHGTXM'),
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

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Divider(
        height: 1,
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ButtonTheme(
        height: 5.2 * SizeConfig.heightSizeMultiplier,
        child: FlatButton(
          onPressed: () {},
          color: Colors.redAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'NHGTXM',
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}

class DarkModeToggle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DarkModeToggleState();
  }
}

class DarkModeToggleState extends State<DarkModeToggle>{
  @override
  Widget build(BuildContext context) {
    return             Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 70,
        child: Card(
          color: mainColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.brightness_6, color: Colors.white,),
                    ),
                    Text(
                      "Dark Mode",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'NHGTXM'),
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
    );
  }

}
