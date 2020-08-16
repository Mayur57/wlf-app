import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:wlf/res/color.dart';
import 'package:wlf/res/strings.dart';
import 'package:wlf/util/mail.dart';
import '../util/scaler.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs>{
  final _formKey = GlobalKey<FormState>();
  SendMail _sendMail = GetIt.I.get<SendMail>();
  TextEditingController _name = TextEditingController();
  TextEditingController _message = TextEditingController();

  String username = '';
  String userMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.02 * SizeConfig.heightSizeMultiplier),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 1.78 * SizeConfig.heightSizeMultiplier),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                          fontSize: 3.56 * SizeConfig.heightSizeMultiplier,
                          fontFamily: 'NHGTXM',
                          color: mainColor),
                    ),
                  ],
                )),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/CU.png',
                height: 16.70 * SizeConfig.heightSizeMultiplier,
              ),
              SizedBox(
                height: 2.78 * SizeConfig.heightSizeMultiplier,
              ),
              Container(
                width: 84.37 * SizeConfig.widthSizeMultiplier,
                child: Text(
                  contactUs,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'NHGTX',
                    fontSize: 1.77 * SizeConfig.heightSizeMultiplier,
                  ),
                ),
              ),
              SizedBox(
                height: 3.34 * SizeConfig.heightSizeMultiplier,
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
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'NHGTX'),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(
                              1.11 * SizeConfig.heightSizeMultiplier),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                1.11 * SizeConfig.heightSizeMultiplier),
                            gapPadding: 0.22 * SizeConfig.heightSizeMultiplier,
                          ),
                          labelText: 'Name',
                        ),
                        onChanged: (value) {
                          setState(() => username = value);
                        },
                      ),
                      SizedBox(
                        height: 2 * SizeConfig.heightSizeMultiplier,
                      ),
                      TextFormField(
                        maxLength: 2048,
                        maxLines: 8,
                        controller: _message,
                        onChanged: (value) {
                          setState(() => userMessage = value);
                        },
                        validator: (value) =>
                            value.length == 0 ? 'Please enter a message' : null,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'NHGTX'),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(1.11 *
                              SizeConfig.heightSizeMultiplier),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                1.11 * SizeConfig.heightSizeMultiplier),
                            gapPadding: 0.22 * SizeConfig.heightSizeMultiplier,
                          ),
                          labelText: 'Issue',
                        ),
                      ),
                      SizedBox(
                        height: 2 * SizeConfig.heightSizeMultiplier,
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
                                setState(() {
                                  _name.text = "";
                                  _message.text = "";
                                });
                                _sendMail.mail(username, userMessage);
                                Fluttertoast.showToast(
                                    msg:
                                    "Thank you for writing to us! \nWe'll get back to you as soon as possible!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black87,
                                    textColor: Colors.white,
                                    fontSize: 1.78 *
                                        SizeConfig.heightSizeMultiplier);
                              }
                            },
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  11.13 * SizeConfig.heightSizeMultiplier),
                            ),
                            child: Text(
                              'Submit',
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
                        height: 20 * SizeConfig.heightSizeMultiplier,
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

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 1.11 * SizeConfig.heightSizeMultiplier),
      child: Divider(
        color: mainColor,
        height: 0.11 * SizeConfig.heightSizeMultiplier,
        thickness: 0.11 * SizeConfig.heightSizeMultiplier,
      ),
    );
  }
}
