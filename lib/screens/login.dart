import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wlf/res/strings.dart';
import '../main.dart';
import '../util/scaler.dart';

class LoginPage extends StatefulWidget {
  static const String id = "ThankyouPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

//TODO: Change fonts, add regular and bold version of the font, login button is pending
class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: <Widget>[
              //Base images: Logo and Footer
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: new Image.asset(
                        'assets/images/404.png',
                        height: 30 * SizeConfig.heightSizeMultiplier,
                      ),
                    ),
                  ],
                ),
              ),

              //Text and Images
              Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 40 * SizeConfig.heightSizeMultiplier,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          //height: 3.5 * SizeConfig.heightSizeMultiplier,
                          width: 11 * SizeConfig.widthSizeMultiplier,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                              fontFamily: 'Circular Medium',
                              color: bg,
                              fontSize: 5 * SizeConfig.heightSizeMultiplier,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1 * SizeConfig.heightSizeMultiplier,
                    ),
                    Container(
                        color: Colors.white.withOpacity(0),
                        //height: 47.07 * SizeConfig.heightSizeMultiplier,
                        width: 86.37 * SizeConfig.widthSizeMultiplier,
                        child: Card(
                          elevation: 0,
                          color: bg.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, right: 20.0, left: 22.0, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 0.1 * SizeConfig.heightSizeMultiplier,
                                ),
                                Text(
                                  'Email ID',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Circular Medium',
                                      fontSize:
                                          2.1 * SizeConfig.heightSizeMultiplier,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your email',
                                    hintStyle: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 1.64 *
                                            SizeConfig.heightSizeMultiplier),
                                  ),
                                  controller: _username,
                                ),
                                SizedBox(
                                  height: 2.5 * SizeConfig.heightSizeMultiplier,
                                ),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Circular Medium',
                                      fontSize:
                                          2.1 * SizeConfig.heightSizeMultiplier,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextField(
                                  obscureText: true,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your password',
                                    hintStyle: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 1.64 *
                                            SizeConfig.heightSizeMultiplier),
                                  ),
                                  controller: _password,
                                ),
                                SizedBox(
                                  height: 3 * SizeConfig.heightSizeMultiplier,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ButtonTheme(
                                      minWidth: 29.19 *
                                          SizeConfig.widthSizeMultiplier,
                                      height: 4.69 *
                                          SizeConfig.heightSizeMultiplier,
                                      child: FlatButton(
                                        onPressed: () {},
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Text(
                                          'Continue',
                                          style: TextStyle(color: bg),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///Deprecated code
//SizedBox(
//height: 2.34 * SizeConfig.heightSizeMultiplier,
//),
//Text(
//"signupPageInitialTagline",
//style: TextStyle(
//fontFamily: 'Circular Medium',
//fontSize: 1.87 * SizeConfig.heightSizeMultiplier,
//fontWeight: FontWeight.bold),
//),
