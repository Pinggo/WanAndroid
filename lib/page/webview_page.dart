import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_html/flutter_html.dart';
class WebViewPage extends StatelessWidget{
  final String title;
  final String url;

  WebViewPage({this.title, @required this.url,Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Html(
              data: title
          ),
        ),
        body: WebviewScaffold(
          url: url,
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          initialChild: Container(
              alignment: Alignment.topCenter,
              child: Container(
                height: 4,
                child: LinearProgressIndicator(),
              )
          ),
        ),
      );
  }
}