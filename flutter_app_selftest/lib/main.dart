import 'package:flutter/material.dart';

void main()=>runApp(MyHome());

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Test',
      theme: ThemeData.dark(),
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('fuck'),
            Text('you'),
          ],
        ),
      ),
    );
  }

}