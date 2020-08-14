import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import 'package:wlf/res/color.dart';
import 'package:wlf/res/strings.dart';
import 'package:wlf/util/scaler.dart';
import '../res/color.dart';

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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10 * SizeConfig.heightSizeMultiplier),
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
                      width: 3.72 * SizeConfig.widthSizeMultiplier,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 3.58 * SizeConfig.textSizeMultiplier,
                          fontFamily: 'NHGTXM',
                          color: mainColor),
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
              height: 25.75 * SizeConfig.heightSizeMultiplier,
            ),
            SizedBox(
              height: 2.23 * SizeConfig.heightSizeMultiplier,
            ),
            Developers(),
            CustomDivider(),
            AboutUs(),
            CustomDivider(),
            PrivacyPolicy(),
            CustomDivider(),
            TermsAndConditions(),
            CustomDivider(),
            Padding(
              padding: EdgeInsets.all(1.11 * SizeConfig.heightSizeMultiplier),
              child: GestureDetector(
                onTap: _showLogoutAlertConfirmationDialog,
                child: Card(
                  color: Colors.redAccent,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 6.68 * SizeConfig.heightSizeMultiplier,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(
                            0.89 * SizeConfig.heightSizeMultiplier),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(
                                  0.89 * SizeConfig.heightSizeMultiplier),
                              child: Icon(
                                Icons.power_settings_new,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize:
                                      2.22 * SizeConfig.heightSizeMultiplier,
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
              height: 10 * SizeConfig.heightSizeMultiplier,
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
}

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildList() {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 2.24 * SizeConfig.heightSizeMultiplier,
                horizontal: 1.80 * SizeConfig.heightSizeMultiplier),
            child: Container(
              child: Text(
                aboutUs, //TODO: Add AboutUs
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'NHGTX',
                    color: Color(0xFF5E5E5E),
                    fontSize: 1.67 * SizeConfig.heightSizeMultiplier),
              ),
            ),
          ),
        ],
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: EdgeInsets.all(1.11 * SizeConfig.heightSizeMultiplier),
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
                    height: 6.68 * SizeConfig.heightSizeMultiplier,
                    color: mainColor.withOpacity(0.7),
                    child: Padding(
                      padding: EdgeInsets.all(
                          1.12 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(
                                    0.90 * SizeConfig.heightSizeMultiplier),
                                child: Icon(
                                  Icons.insert_emoticon,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "About Us",
                                style: TextStyle(
                                    fontSize:
                                        2.25 * SizeConfig.heightSizeMultiplier,
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
          ///Mayur Bhoi
          Padding(
            padding: EdgeInsets.all(0.89 * SizeConfig.heightSizeMultiplier),
            child: Card(
              color: Color(0xFF4EC8DF),
              child: Container(
                height: 20 * SizeConfig.heightSizeMultiplier,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(
                          1.34 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/developers-02.png',
                            height: 8.91 * SizeConfig.heightSizeMultiplier,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    0.89 * SizeConfig.heightSizeMultiplier,
                                horizontal:
                                    1.78 * SizeConfig.heightSizeMultiplier),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Mayur Bhoi',
                                  style: TextStyle(
                                      fontSize: 2.78 *
                                          SizeConfig.heightSizeMultiplier,
                                      color: Colors.white,
                                      fontFamily: 'NHGTXM'),
                                ),
                                Divider(
                                  height:
                                      0.56 * SizeConfig.heightSizeMultiplier,
                                ),
                                Text(
                                  'Flutter Developer',
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'NHGTX'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 0.89 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              String link =
                                  "https://www.linkedin.com/in/mayur-bhoi-a60081175";
                              if (await canLaunch(link)) {
                                await launch(link);
                              } else {
                                throw 'Could not launch the link';
                              }
                            },
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              String link =
                                  "https://www.instagram.com/mayurbhoii/";
                              if (await canLaunch(link)) {
                                await launch(link);
                              } else {
                                throw 'Could not launch the link';
                              }
                            },
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              String link = "https://twitter.com/mayurtheboi";
                              if (await canLaunch(link)) {
                                await launch(link);
                              } else {
                                throw 'Could not launch the link';
                              }
                            },
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              String link = "https://github.com/Mayur57";
                              if (await canLaunch(link)) {
                                await launch(link);
                              } else {
                                throw 'Could not launch the link';
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ///Aryaman Singh
          Padding(
            padding: EdgeInsets.all(0.5 * SizeConfig.heightSizeMultiplier),
            child: Card(
              color: Color(0xFF4EC8DF),
              child: Container(
                height: 20 * SizeConfig.heightSizeMultiplier,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(
                          1.34 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/developers-01.png',
                            height: 8.91 * SizeConfig.heightSizeMultiplier,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    0.89 * SizeConfig.heightSizeMultiplier,
                                horizontal:
                                    1.78 * SizeConfig.heightSizeMultiplier),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Aryaman Singh',
                                  style: TextStyle(
                                      fontSize: 2.78 *
                                          SizeConfig.heightSizeMultiplier,
                                      color: Colors.white,
                                      fontFamily: 'NHGTXM'),
                                ),
                                Divider(
                                  height:
                                      0.55 * SizeConfig.heightSizeMultiplier,
                                ),
                                Text(
                                  'Flutter Developer',
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'NHGTX'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 0.5 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              String link =
                                  "https://www.linkedin.com/in/as-aryamansingh";
                              if (await canLaunch(link)) {
                                await launch(link);
                              } else {
                                throw 'Could not launch the link';
                              }
                            },
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              String link =
                                  "https://www.instagram.com/as.aryamansingh/";
                              if (await canLaunch(link)) {
                                await launch(link);
                              } else {
                                throw 'Could not launch the link';
                              }
                            },
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              String link = "https://github.com/aaryaa07";
                              if (await canLaunch(link)) {
                                await launch(link);
                              } else {
                                throw 'Could not launch the link';
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ///Kastab
          Padding(
            padding: EdgeInsets.all(0.5 * SizeConfig.heightSizeMultiplier),
            child: Card(
              color: Color(
                  0xFF4EC8DF), //Lightened Main Color due to opacity incompatibilities
              child: Container(
                height: 20 * SizeConfig.heightSizeMultiplier,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(
                          1.34 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/developers-03.png',
                            height: 8.91 * SizeConfig.heightSizeMultiplier,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    0.89 * SizeConfig.heightSizeMultiplier,
                                horizontal:
                                    1.78 * SizeConfig.heightSizeMultiplier),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Kaustubh Sharma',
                                  style: TextStyle(
                                      fontSize: 2.78 *
                                          SizeConfig.heightSizeMultiplier,
                                      color: Colors.white,
                                      fontFamily: 'NHGTXM'),
                                ),
                                Divider(
                                  height:
                                      0.55 * SizeConfig.heightSizeMultiplier,
                                ),
                                Text(
                                  'Flutter Developer',
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'NHGTX'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 0.89 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              String link =
                                  "https://www.linkedin.com/in/kaustubh-sharma-267469183";
                              if (await canLaunch(link)) {
                                await launch(link);
                              } else {
                                throw 'Could not launch the link';
                              }
                            },
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              String link = "https://github.com/1KS6";
                              if (await canLaunch(link)) {
                                await launch(link);
                              } else {
                                throw 'Could not launch the link';
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: EdgeInsets.all(1.11 * SizeConfig.heightSizeMultiplier),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: false,
                    hasIcon: false,
                  ),
                  header: Container(
                    height: 6.68 * SizeConfig.heightSizeMultiplier,
                    color: mainColor.withOpacity(0.7),
                    child: Padding(
                      padding: EdgeInsets.all(
                          1.11 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(
                                    0.89 * SizeConfig.heightSizeMultiplier),
                                child: Icon(
                                  Icons.code,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "The Developers",
                                style: TextStyle(
                                    fontSize:
                                        2.23 * SizeConfig.heightSizeMultiplier,
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
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 2.23 * SizeConfig.heightSizeMultiplier,
                horizontal: 1.78 * SizeConfig.heightSizeMultiplier),
            child: Container(
              child: Text(
                privacyPolicy,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'NHGTX',
                  color: Color(0xFF5E5E5E),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: EdgeInsets.all(1.11 * SizeConfig.heightSizeMultiplier),
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
                    height: 6.68 * SizeConfig.heightSizeMultiplier,
                    color: mainColor.withOpacity(0.7),
                    child: Padding(
                      padding: EdgeInsets.all(
                          1.11 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(
                                    0.89 * SizeConfig.heightSizeMultiplier),
                                child: Icon(
                                  Icons.assignment_turned_in,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                    fontSize:
                                        2.22 * SizeConfig.heightSizeMultiplier,
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

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildList() {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 2.23 * SizeConfig.heightSizeMultiplier,
                horizontal: 1.78 * SizeConfig.heightSizeMultiplier),
            child: Container(
              child: Text(
                t_and_c,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'NHGTX',
                  color: Color(0xFF5E5E5E),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: EdgeInsets.all(1.11 * SizeConfig.heightSizeMultiplier),
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
                    height: 6.68 * SizeConfig.heightSizeMultiplier,
                    color: mainColor.withOpacity(0.7),
                    child: Padding(
                      padding: EdgeInsets.all(
                          1.11 * SizeConfig.heightSizeMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(
                                    0.89 * SizeConfig.heightSizeMultiplier),
                                child: Icon(
                                  Icons.assignment,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Terms and Conditions",
                                style: TextStyle(
                                    fontSize:
                                        2.23 * SizeConfig.heightSizeMultiplier,
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
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
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
      padding: EdgeInsets.symmetric(
          horizontal: 2.78 * SizeConfig.heightSizeMultiplier),
      child: Divider(
        height: 0.11 * SizeConfig.heightSizeMultiplier,
      ),
    );
  }
}
