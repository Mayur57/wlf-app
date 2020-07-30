import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/screens/content.dart';
import 'package:wlf/util/scaler.dart';
import 'package:wlf/widgets/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final _firestore = Firestore.instance;
  String title;
  String article;
  var i = 0;
  var titles = [];
  var articles = [];

  bool fab = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 500) {
        setState(() => fab = true);
      } else {
        setState(() => fab = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 3.5 * SizeConfig.heightSizeMultiplier,
              ),
            ),
          ),
        ],
        title: Text("Whatup' Life Foundation"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      floatingActionButton: !fab
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: new Duration(seconds: 1), curve: Curves.ease);
              },
            ),
      backgroundColor: Colors.lightBlueAccent,
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("blogs").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Text("Check Internet Connection")
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot _blog = snapshot.data.documents[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContentPage(
                              _blog.data["title"],
                              _blog.data["article"],
                              _blog.data["author"],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 280,
                        child: Card(
                          color: Colors.white.withOpacity(0),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: EdgeInsets.all(10),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 280.0,
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: CachedNetworkImageProvider(
                                          _blog.data["image_url"]),
                                    )),
                              ),
                              Container(
                                height: 280,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.blue,
                                  gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.6),
                                      Colors.black.withOpacity(0.6),
                                    ],
                                    stops: [0.0, 1.0],
                                  ),
                                ),
                              ),
                              Container(
                                height: 280,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 12.0),
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  _blog.data["title"].length > 60
                                      ? _blog.data["title"].substring(0, 60) +
                                          '...'
                                      : _blog.data["title"],
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
        },
      ),
    );
  }
}
