import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'demo',
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home: Scaffold(
          body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Time',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  MaterialButton(
                    height: 190,
                    onPressed: (){},
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                ]
            ),
          ),
        ));
  }
}
