import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JooRun Project V.1',
      theme: ThemeData(
        primaryColor: Colors.yellow[600],
      ),
      home: HomeApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JooRun',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.gps_not_fixed,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: Center(
        child: ButtonTheme(
          minWidth: 400,
          height: 200,
          child: Container(
            margin: EdgeInsets.only(bottom: 10),  //바닥으로부터의 여백
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text(
                  'Run',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 130,
                  ),
                ),
                onPressed: (){
                  //버튼 눌렀을 때 실행될 함수
                },
                color: Colors.yellow[700],

              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        // 햄버거
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,
              decoration: BoxDecoration(
                color: Colors.yellow[600],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
