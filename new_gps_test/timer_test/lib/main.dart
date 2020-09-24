import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: Counter());
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

int timeRecord = 0;
bool isCount = false;

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Count: $timeRecord',
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text('시작'),
            onPressed: () {
              setState(() {
                isCount ? isCount = false: isCount = true;
                startTimer();
              });
            },
          )
        ],
      ),
    );
  }

  void startTimer() {
    Timer _timer;
    int _start = 0;
    
    const oneSec = const Duration(milliseconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        //10으로 나눈것을 int 로 변환
        timeRecord = _start~/10;
        if(isCount == false){
          timer.cancel();
        }
        else{
          _start = _start +1;
        }
      });
    });
    
  }
}
