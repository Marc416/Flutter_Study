import 'package:flutter/material.dart';
import 'screens/home.screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //안먹는데?? 아 아니네 프라이머리 컬러는 앱바 색상같은거에 적용되는거임
        primarySwatch: Colors.deepOrange, primaryColor: Colors.greenAccent,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}