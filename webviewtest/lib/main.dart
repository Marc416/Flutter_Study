import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: WebView(
              initialUrl: 'https://www.google.com',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ),
      );
  }
}