import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/util/scaler.dart';

class ContentPage extends StatefulWidget {
  final String title;
  final String content;
  final String author;
  ContentPage(this.title, this.content, this.author);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatup' Life Foundation"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              SizedBox(height: 5 * SizeConfig.heightSizeMultiplier),
              new Text(
                widget.title,
                style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5 * SizeConfig.heightSizeMultiplier,
              ),
              new Text(
                widget.content,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 5 * SizeConfig.heightSizeMultiplier,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "-"+widget.author,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
