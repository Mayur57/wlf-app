import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wlf/res/strings.dart';
import '../main.dart';
import '../util/scaler.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController _subject = TextEditingController();
  TextEditingController _message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
        child:Center(
          child:Padding(
            padding: EdgeInsets.only(top:80),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image:AssetImage('assets/images/404.png'),
                      height:30 * SizeConfig.heightSizeMultiplier
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      //height: 3.5 * SizeConfig.heightSizeMultiplier,
                      width: 11 * SizeConfig.widthSizeMultiplier,
                    ),
                    Text("Contact Us",
                    style: TextStyle(
                        fontFamily: 'Circular Medium',
                        color: bg,
                        fontSize: 5 * SizeConfig.heightSizeMultiplier,
                        fontWeight: FontWeight.bold
                    ),),

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
                              'Subject',
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
                                hintText: 'Enter subject',
                                hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 1.64 *
                                        SizeConfig.heightSizeMultiplier),
                              ),
                              controller: _subject,
                            ),
                            SizedBox(
                              height: 2.5 * SizeConfig.heightSizeMultiplier,
                            ),
                            Text(
                              'Message',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Circular Medium',
                                  fontSize:
                                  2.1 * SizeConfig.heightSizeMultiplier,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextField(

//
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(

                                border: InputBorder.none,
                                hintText: 'Type your message here',
                                hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 1.64 *
                                        SizeConfig.heightSizeMultiplier),
                              ),
                              controller: _message,
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
                                      'Submit',
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
          )
        )
      )
    );
  }
}

