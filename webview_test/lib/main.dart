import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//서버의 내용을 플러터로 가져올때.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hi'),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: 'http://34.68.194.62/',
          onPageFinished: (String url){print('웹뷰'+url);},
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: Set.from([
            JavascriptChannel(
              name: 'jam',
              onMessageReceived: (JavascriptMessage result) {
                print('메시지: ${result.message}');
              },
            )


          ]),
        ),
      ),

      floatingActionButton: Container(
        height: 500,
        width: 500,
        child: SafeArea(
          child: FittedBox(
            child: RaisedButton(onPressed: (){},),
          ),
        ),
      )
    );
  }
}

