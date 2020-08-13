import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/res/strings.dart';
import 'package:wlf/util/scaler.dart';


class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  bool _visible;
  MyAppBar(this._visible );
  num height = 90.0;
  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _MyAppBarState extends State<MyAppBar> {
  ImageProvider logo = AssetImage(loginPageLogoImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(top: 8.0),
      color: Colors.transparent,
      child: AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: widget._visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 180),
          // The green box must be a child of the AnimatedOpacity widget.
          child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                automaticallyImplyLeading: false,
                flexibleSpace: SafeArea(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 13),
                        Image.asset(
                          loginPageLogoImage,
                          //loginPageLogoImageBlue,
                            height: 55,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}


