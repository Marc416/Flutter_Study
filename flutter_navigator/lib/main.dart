import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container WIdget',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  //scaffold를 리턴하는 위젯 하나하나가 모두 라우트임
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to SecondPage'),
          onPressed: () {
            Navigator.push(
              ctx,
              MaterialPageRoute(builder: (ctx) => SecondPage()),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to FirstPage'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
