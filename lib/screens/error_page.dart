import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/res/strings.dart';

import '../main.dart';


///Does NOT face the end user only for handling error during development
class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
//            Text(
//              errorPagePageNotFound,
//              style: TextStyle(fontFamily: 'Circular Medium', fontSize: 30),
//            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Page ID: JHAS-87B3-BJCD-CNDS (Dummy)', //TODO: Handle page IDs
              style: TextStyle(fontFamily: 'Circular Medium', fontSize: 10),
            ),
            SizedBox(
              height: 10,
            ),
//            Container(
//              width: 330,
//              child: Text(
//                errorPageUserErrorMessage,
//                style: TextStyle(fontFamily: 'Circular Medium', fontSize: 16),
//                textAlign: TextAlign.center,
//              ),
//            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: bg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              padding: EdgeInsets.only(
                  left: 40, top: 15, right: 40, bottom: 15),
              //color: Colors.white,
              onPressed: () {
                debugPrint('Developer Log Message: Go Back button');
                //TODO: Add onClick() functionality for the button
              },
              child: Text(
                "Go Back",
                style: TextStyle(
                  fontFamily: 'Circular Medium',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
