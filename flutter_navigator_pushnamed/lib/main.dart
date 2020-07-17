import 'package:flutter/material.dart';
import 'package:flutter_navigator_pushnamed/ScreenA.dart';
import 'package:flutter_navigator_pushnamed/ScreenB.dart';
import 'package:flutter_navigator_pushnamed/ScreenC.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context)=>ScreenA(),
        '/b': (context)=>ScreenB(),
        '/c': (context)=>ScreenC(),
      },
    );
  }
}