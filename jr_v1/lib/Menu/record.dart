import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Record extends StatefulWidget {
  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text(
          '러닝기록',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(context),
    );
  }

  Widget Body(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40),
              alignment: Alignment.center,
              child: Text(
                '48.07' + 'KM',
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: Container(color: Colors.amber,),)

//                RaisedButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
