import 'package:flutter/material.dart';
import 'package:jr_v1/menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
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
        child: MenuList(),
      ),
    );
  }
}