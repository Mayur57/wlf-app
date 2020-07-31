import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wlf/res/color.dart';
import 'package:wlf/res/strings.dart';
import '../main.dart';
import '../util/scaler.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _subject = TextEditingController();
  TextEditingController _message = TextEditingController();

  String username = '';
  String userSubject = '';
  String userMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Header
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: wlfCoral,
                boxShadow: [
                  BoxShadow(
                    color: wlfCoral.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SafeArea(
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
                          "Contact Us",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'NHGTX',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
            Container(
                width: 84.37 * SizeConfig.widthSizeMultiplier,
                child: Text(
                  lipsum,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'NHGTX',
                    fontSize: 15,
                  ),
                )),
            //The form
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                width: 84.37 * SizeConfig.widthSizeMultiplier,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        maxLength: 64,
                        controller: _name,
                        validator: (value) {
                          //TODO: Validate the name, throw error if empty
                          return '';
                        },
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        style: TextStyle(
                            color: Colors.black, fontFamily: NHregular),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            gapPadding: 2,
                          ),
                          labelText: 'Name',
                        ),
                        onChanged: (value) {
                          setState(() => username = value);
                        },
                      ),
                      SizedBox(
                        height: 1 * SizeConfig.heightSizeMultiplier,
                      ),
                      TextFormField(
                        maxLength: 512,
                        maxLines: 10,
                        controller: _message,
                        onChanged: (value) {
                          setState(() => userMessage = value);
                        },
                        validator: (value) => value.length == 0
                            ? 'Please enter a message'
                            : null,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            color: Colors.black, fontFamily: NHregular),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            gapPadding: 2,
                          ),
                          labelText: 'Issue',
                        ),
                      ),
                      SizedBox(
                        height: 1 * SizeConfig.heightSizeMultiplier,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ButtonTheme(
                          minWidth: 84.37 * SizeConfig.widthSizeMultiplier,
                          height: 5.2 * SizeConfig.heightSizeMultiplier,
                          child: FlatButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/test');
                              }
                            },
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: NHregular,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Bottom Sheet for Devs Queries
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFFD7C6F),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFD7C6F).withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, -3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "For app related queries or bug reports, click here",
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'NHGTX', color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
