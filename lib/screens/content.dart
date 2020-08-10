import 'dart:async';
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
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: WebView(
          initialUrl: 'https://en.wikipedia.org/wiki/Cristiano_Ronaldo',
          // 'https://www.whatuplifefoundation.com/post/productivity-in-lockdown',
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
