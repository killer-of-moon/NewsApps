import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  @override
  _ArticleViewState createState() => _ArticleViewState();
  String postUrl;

  ArticleView({@required this.postUrl});
}

class _ArticleViewState extends State<ArticleView> {
  Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121212),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.postUrl,
            onWebViewCreated: (WebViewController webViewController) {
              _completer.complete(webViewController);
            },
          ),
        ));
  }
}
