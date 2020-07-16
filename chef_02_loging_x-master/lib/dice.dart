import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  int leftDice = 1;
  int rightDice = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(33.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Expanded(
                   //flex: 2, ////Flex별로 비율을 바꿔줄 수 있음
                     child: Image.asset('image/dice$leftDice.png')),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    //flex: 1,
                    child: Image.asset('image/dice$rightDice.png'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ButtonTheme(
              minWidth: 100,
              height: 60,
              child: RaisedButton(
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
                color: Colors.orangeAccent,
                onPressed: (){
                  setState(() {
                    //랜덤 함수 이후 +1을 하는 이유는 0~5를 1~6으로바꾸기위함
                    leftDice = Random.secure().nextInt(6)+1;
                    rightDice = Random.secure().nextInt(6)+1;
                  });
                  showToast('hey');
                },
              ),
            )
          ],
        )
      ),
    );
  }
}

void showToast(String message) {




  Widget toast = Container(
    padding: const EdgeInsets.symmetric(
        horizontal: 24.0, vertical: 12.0
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text(message),
      ],
    ),
  );


  _showToast(){
    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2)
    );
  }
}