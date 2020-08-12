import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/res/color.dart';

class PublicNotifications extends StatelessWidget {
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
                      padding: EdgeInsets.only(bottom: 65.0, top: 17.0),
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot _notifications =
                            snapshot.data.documents[index];
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: mainColor.withOpacity(0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _notifications.data["title"],
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'NHGTXM',
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Flexible(
                                      child: Text(
                                        _notifications.data["details"],
                                        style: _notifications
                                                    .data["details"]
                                                    .length >
                                                125
                                            ? TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'NHGTX',
                                                color: Colors.white)
                                            : TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'NHGTX',
                                                color: Colors.white),
                                      ),
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
