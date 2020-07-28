import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wlf/util/scaler.dart';

import '../util/scaler.dart';


class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          width: 1 * SizeConfig.widthSizeMultiplier,
          height: 0.20 * SizeConfig.widthSizeMultiplier,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: Icon(Icons.chat),
                      iconSize: 35,
                    )
                ),
                Container(
                  child: Text(
                    "Whatup\' Life\nFoundation",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(Icons.chat),
                    iconSize: 35,
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
