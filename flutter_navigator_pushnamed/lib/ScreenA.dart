import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.red,
            child: Text('Go to Screen B'),
            onPressed: (){
              Navigator.pushNamed(context, '/b');
            }
          ),
          RaisedButton(
              color: Colors.red,
              child: Text('Go to Screen C'),
              onPressed: (){
                Navigator.pushNamed(context, '/c');
                print(context);
              }
          ),
        ],
        ),
      ),
    );
  }
  
}