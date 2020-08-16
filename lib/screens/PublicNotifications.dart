import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/res/color.dart';
import 'package:wlf/util/scaler.dart';

class PublicNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("public_notifications")
          .orderBy('id', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: <Widget>[
                  ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: 7.23 * SizeConfig.heightSizeMultiplier,
                          top: 1.89 * SizeConfig.heightSizeMultiplier),
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot _notifications =
                            snapshot.data.documents[index];
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.89 * SizeConfig.heightSizeMultiplier,
                              horizontal:
                                  0.89 * SizeConfig.heightSizeMultiplier),
                          height: 16.70 * SizeConfig.heightSizeMultiplier,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                1.78 * SizeConfig.heightSizeMultiplier),
                            child: Container(
                              height: 11.13 * SizeConfig.heightSizeMultiplier,
                              decoration: BoxDecoration(
                                color: mainColor.withOpacity(0.5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        1.45 * SizeConfig.heightSizeMultiplier,
                                    vertical:
                                        0.89 * SizeConfig.heightSizeMultiplier),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _notifications.data["title"],
                                        style: TextStyle(
                                            fontSize: 2.78 *
                                                SizeConfig.heightSizeMultiplier,
                                            fontFamily: 'NHGTXM',
                                            color: Colors.white),
                                      ),
                                    ),
                                    Flexible(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          _notifications.data["details"],
                                          style: TextStyle(
                                            fontSize: 1.78 *
                                                SizeConfig.heightSizeMultiplier,
                                            fontFamily: 'NHGTX',
                                            color: Colors.white,
                                          ),
                                        ),
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
