import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wlf/screens/content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wlf/widgets/appBar.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool _visible = true;
  bool isScrollingDown = false;

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
    myScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void myScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          _scrollController.position.pixels > 100) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _visible = false;
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _visible = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: fab ? floatingActionButton() : null,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: MyAppBar(_visible),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("blogs").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: <Widget>[
                    ListView.builder(
                        padding: EdgeInsets.only(bottom: 65.0, top: 102),
                        controller: _scrollController,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot _blog =
                              snapshot.data.documents[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContentPage(
                                    _blog.data["url"],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 400,
                              child: Card(
                                //shadowColor: Colors.blue,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 400.0,
                                      //margin: EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: CachedNetworkImageProvider(
                                              _blog.data["image_url"]),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 390,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.blue,
                                        gradient: LinearGradient(
                                          begin: FractionalOffset.topCenter,
                                          end: FractionalOffset.bottomCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.27),
                                            Colors.black.withOpacity(0.27),
                                          ],
                                          stops: [0.0, 1.0],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 380,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 12.0),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        _blog.data["title"].length > 60
                                            ? _blog.data["title"]
                                                    .substring(0, 60) +
                                                '...'
                                            : _blog.data["title"],
                                        style: TextStyle(
                                            fontFamily: 'NHGTX',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
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
                        }),
                  ],
                );
        },
      ),
    );
  }

  floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      onPressed: () {
        _scrollController.animateTo(0,
            duration: new Duration(seconds: 1), curve: Curves.ease);
      },
    );
  }
}
