import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:wlf/res/color.dart';
import '../res/color.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);
  @override
  State createState() {
    return SettingsState();
  }
}

class SettingsState extends State<Settings> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 32, fontFamily: 'NHGTXM', color: mainColor),
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: ExpandableTheme(
        data: ExpandableThemeData(),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Image.asset(
              'assets/images/settings.png',
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            AboutUs(),
            CustomDivider(),
            Developers(),
            CustomDivider(),
            PrivacyPolicy(),
            CustomDivider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: _showLogoutAlertConfirmationDialog,
                child: Card(
                  color: Colors.redAccent,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.power_settings_new,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'NHGTXM'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  _showLogoutAlertConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutAlertConfirmation();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
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
                    color: mainColor.withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.insert_emoticon,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "About Us",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'NHGTXM'),
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
                    color: mainColor.withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.code,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "The Developers",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'NHGTXM'),
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

class PrivacyPolicy extends StatelessWidget {
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
                    color: mainColor.withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.assignment_turned_in,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'NHGTXM'),
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

class LogoutAlertConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Logout',
        style: TextStyle(
          fontFamily: 'NHGTXM',
        ),
      ),
      content: Text(
        "Are you sure you want to logout of the app?",
        style: TextStyle(
          fontFamily: 'NHGTX',
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: mainColor,
              fontFamily: 'NHGTXM',
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.redAccent,
              fontFamily: 'NHGTXM',
            ),
          ),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
            prefs.remove('user_uid');
            await FirebaseAuth.instance.signOut().then((value) {
              Navigator.of(context).pushReplacementNamed('/login');
            });
          },
        ),
      ],
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

class DarkModeToggle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DarkModeToggleState();
  }
}

class DarkModeToggleState extends State<DarkModeToggle> {
  bool isDark = true;

  _toggleTheme() {
    if (!isDark) {
      print("Dark theme disabled");
    } else {
      print("Dark theme enabled");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 70,
        child: Card(
          color: mainColor.withOpacity(0.7),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.brightness_6,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Dark Mode",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'NHGTXM'),
                    ),
                  ],
                ),
                Switch(
                  activeColor: Colors.white,
                  value: isDark,
                  onChanged: (bool toggle) {
                    setState(() {
                      isDark = toggle;
                      _toggleTheme();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
