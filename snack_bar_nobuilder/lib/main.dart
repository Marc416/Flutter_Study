import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Snack Bar'),
        centerTitle: true,
      ),
      body: MySnackBar(),
    );
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Show me'),
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Hello',
              textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.teal,
              ///밀리세컨은 1초를 이야기 한다
              ///Duration은 해당 효과를 지속하는 시간을 이야기한다
              duration: Duration(milliseconds: 100),
            ),
          );
        },
      ),
    );
  }
}
