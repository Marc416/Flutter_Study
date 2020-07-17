import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container WIdget',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Text('Container1'),
                width: 100,
                height: 100,
                color: Colors.white,
              ),
              Container(
                child: Text('Container2'),
                width: 100,
                height: 100,
                color: Colors.blue[300],
              ),
              Container(
                child: Text('Container1'),
                width: 100,
                height: 100,
                color: Colors.redAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
