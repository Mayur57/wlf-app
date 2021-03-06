import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wlf/util/scaler.dart';

class ContentPage extends StatefulWidget {
  final String url;

  ContentPage(this.url);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  WebViewController _myController;
  bool flag = false;
  bool showSpinner = false;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    showSpinner = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatup' Life Foundation",
            style: TextStyle(
                color: Color(0xFF2D2D2D),
                fontFamily: 'NHGTX',
                fontWeight: FontWeight.w100,
                letterSpacing: 0.05 * SizeConfig.heightSizeMultiplier)),
        centerTitle: true,
        backgroundColor: Color(0xFFECECE4),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xFF2D2D2D),
        ),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        color: Colors.white,
        opacity: 1,
        inAsyncCall: showSpinner,
        child: Stack(children: <Widget>[
          if (!flag)
            Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity),
          Padding(
            padding: EdgeInsets.all(0.89 * SizeConfig.heightSizeMultiplier),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: WebView(
                  initialUrl: widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                    _myController = webViewController;
                  },
                  onPageStarted: (String url) {
                    setState(() {});
                  },
                  onPageFinished: (String url) async {
                    print('Page finished loading: $url');
                    _myController.evaluateJavascript(
                      "document.getElementsByTagName('header')[0].style.display='none';",
                    );
                    _myController.evaluateJavascript(
                      "document.querySelectorAll('._26v3s')[1].style.display='none';document.querySelectorAll('.blog-post-title-font')[0].style.fontSize='30px';",
                    );
                    _myController.evaluateJavascript(
                      "let x=document.getElementsByTagName('p').length;for(let i=0;i<x;i++){document.getElementsByTagName('p')[i].style.fontSize='16px';}",
                    );
                    _myController.evaluateJavascript(
                        "document.getElementsByClassName('_26v3s ')[2].style.display='none';");
                    _myController.evaluateJavascript(
                        "document.getElementsByClassName('_1nBO7')[0].style.display='none';");
                    _myController.evaluateJavascript(
                        "document.getElementById('SITE_FOOTERinlineContent').style.display='none';");
                    setState(() {
                      showSpinner = false;
                      flag = true;
                    });
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
