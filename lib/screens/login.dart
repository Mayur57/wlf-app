import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wlf/res/strings.dart';
import 'package:wlf/util/authentication.dart';
import '../util/scaler.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  Services _services = GetIt.I.get<Services>();
  String userEmail = '';
  String userPassword = '';
  String userConfirmPassword = '';
  String result;

  bool hasLoaded = true;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 22.27 * SizeConfig.heightSizeMultiplier,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/header-01.png'),
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi,
                child: Container(
                  height: 22.27 * SizeConfig.heightSizeMultiplier,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/header-01.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 24.63 * SizeConfig.heightSizeMultiplier,
                  ),
                  Image.asset(
                    loginPageLogoImage,
                    width: 58.13 * SizeConfig.widthSizeMultiplier,
                  ),
                  SizedBox(
                    height: 2.23 * SizeConfig.heightSizeMultiplier,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontFamily: 'NHGTX',
                        fontWeight: FontWeight.bold,
                        fontSize: 4.45 * SizeConfig.heightSizeMultiplier),
                  ),
                  Text(
                    "Login to proceed further",
                    style: TextStyle(
                        fontFamily: 'NHGTX',
                        fontSize: 2.23 * SizeConfig.heightSizeMultiplier),
                  ),
                  Container(
                    width: 84.37 * SizeConfig.widthSizeMultiplier,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 5 * SizeConfig.heightSizeMultiplier,
                          ),
                          TextFormField(
                            controller: _email,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter an email';
                              } else if ((!value.contains('@')) ||
                                  (!value.contains('.com'))) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'NHGTX'),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(
                                  1.11 * SizeConfig.heightSizeMultiplier),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    1.11 * SizeConfig.heightSizeMultiplier),
                                gapPadding:
                                    0.22 * SizeConfig.heightSizeMultiplier,
                              ),
                              labelText: 'Email ID',
                            ),
                            onChanged: (value) {
                              setState(() => userEmail = value);
                            },
                          ),
                          SizedBox(
                            height: 3 * SizeConfig.heightSizeMultiplier,
                          ),
                          TextFormField(
                            controller: _pass,
                            onChanged: (value) {
                              setState(() => userPassword = value);
                            },
                            validator: (value) =>
                                value.length < 6 ? 'Incorrect Password' : null,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'NHGTX'),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(
                                  1.11 * SizeConfig.heightSizeMultiplier),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    1.11 * SizeConfig.heightSizeMultiplier),
                                gapPadding:
                                0.22 * SizeConfig.heightSizeMultiplier,
                              ),
                              labelText: 'Password',
                            ),
                          ),
                          SizedBox(
                            height: 3.5 * SizeConfig.heightSizeMultiplier,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ButtonTheme(
                              minWidth: 84.37 * SizeConfig.widthSizeMultiplier,
                              height: 5.2 * SizeConfig.heightSizeMultiplier,
                              child: FlatButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _email.text = "";
                                      _pass.text = "";
                                    });
                                    _loaderFlagToggle();
                                    _login();
                                  }
                                },
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11.13 *
                                        SizeConfig.heightSizeMultiplier)),
                                child: !hasLoaded
                                    ? Center(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.89 *
                                                SizeConfig
                                                    .heightSizeMultiplier,
                                            horizontal: 1.34 *
                                                SizeConfig
                                                    .heightSizeMultiplier),
                                        child: Container(
                                          height: 1.67 *
                                              SizeConfig
                                                  .heightSizeMultiplier,
                                          width: 1.67 *
                                              SizeConfig
                                                  .heightSizeMultiplier,
                                          child:
                                          CircularProgressIndicator(
                                            strokeWidth: 0.27 *
                                                SizeConfig
                                                    .heightSizeMultiplier,
                                            valueColor:
                                            new AlwaysStoppedAnimation<
                                                Color>(Colors.white),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Loading...',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'NHGTXM',
                                          fontSize: 1.89 *
                                              SizeConfig
                                                  .heightSizeMultiplier,
                                        ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'NHGTXM',
                                          fontSize: 1.89 *
                                              SizeConfig.heightSizeMultiplier,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5 * SizeConfig.heightSizeMultiplier,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _login() async {
    final result = await _services.signIn(userEmail, userPassword);
    if (!result.contains("ERROR")) {
      Fluttertoast.showToast(
        msg: "You are now logged in",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue.withOpacity(0.3),
        textColor: Colors.white,
        fontSize: 1.78 * SizeConfig.heightSizeMultiplier,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', userEmail);
      Navigator.of(context).pushReplacementNamed('/test');
    } else {
      _showMyDialog(result);
    }
  }

  _loaderFlagToggle() {
    setState(() {
      hasLoaded ? hasLoaded = false : hasLoaded = true;
    });
  }

  Future<Widget> _showMyDialog(String message) async {
    return showDialog<Widget>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Authentication Error',
            style: TextStyle(
              fontFamily: 'NHGTXM',
            ),
          ),
          content: Text(
            message.substring(7),
            style: TextStyle(
              fontFamily: 'NHGTX',
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'NHGTXM',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _loaderFlagToggle();
              },
            ),
          ],
        );
      },
    );
  }
}
