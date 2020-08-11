import 'dart:ui';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/res/color.dart';
import 'package:wlf/util/authentication.dart';

class PublicNotifications extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("public_notifications").snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: <Widget>[
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 65.0, top: 17.0),
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot _notifications =
                            snapshot.data.documents[index];
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 9),
                          height: 170,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: mainColor.withOpacity(0.5),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          _notifications.data["title"],
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontFamily: 'NHGTXM',
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(width: 15),
                                        Flexible(
                                          child: Text(
                                            _notifications.data["details"],
                                            style: _notifications
                                                        .data["details"]
                                                        .length >
                                                    125
                                                ? TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'NHGTXM',
                                                    color: Colors.white)
                                                : TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'NHGTXM',
                                                    color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              );
      },
    );
  }
}
