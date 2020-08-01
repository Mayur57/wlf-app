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
  TextEditingController _message = TextEditingController();

  String username = '';
  String userMessage = '';

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
                      'Contact Us',
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Header
              SizedBox(
                height: 20,
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
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //The form
              Container(
                width: 84.37 * SizeConfig.widthSizeMultiplier,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        maxLength: 64,
                        controller: _name,
                        validator: (value) => value.length == 0
                            ? 'Please enter your full name'
                            : null,
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
                        validator: (value) =>
                            value.length == 0 ? 'Please enter a message' : null,
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
                                //send post request to server/send an email
                              }
                            },
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'NHGTXM',
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
            ],
          ),
        ),
      ),
    );
  }
}
