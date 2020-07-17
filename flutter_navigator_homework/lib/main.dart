import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) =>ScreenA()
      },
      home: Center(
        child: RaisedButton(
          child: Text('Go to ScreenA'),
          onPressed: () =>
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScreenA()),
              ),
        ),
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('Hi Hello'),
      ),
    );
  }
}
