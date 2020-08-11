import 'dart:async';
// import 'dart:html';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlf/util/scaler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPage extends StatefulWidget {
  final String title;
  final String content;
  final String author;
  ContentPage(this.title, this.content, this.author);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  WebViewController _myController;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatup' Life Foundation"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: WebView(
              initialUrl:
                  'https://www.whatuplifefoundation.com/post/what-s-on-your-mind',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                _myController = webViewController;
              },
              onPageFinished: (String url) {
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
              }),
        ),
      ),
    );
  }
}
