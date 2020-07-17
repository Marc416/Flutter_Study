import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container WIdget',
      home: MyPage(),
    );
  }

}

class MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(  //컨테이너는 차일드가 없을경우 최대한의 공간을 차지하려 한다
          color: Colors.red,
          width: 100,
          height: 100,
          //margin: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 10
          ),
          padding: EdgeInsets.all(40),
          child: Text('HEllO'),
        ),
      ),
    );
  }
}
