import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Character Card',
      home: MyCard(),
    );
  }

}

class MyCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BBANTO'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0, //앱바의 그림자를 제거할 때 쓰는데 이건 그림자의 높이를 조절할때 썼음
      ),
//      body: Padding(
//        //바디의 패딩 밑에 패딩을 또 넣는 이유는 정확한 값을 지정하기 위함
//        //EdgeInsets의 30,40은 화면의 30, 40이후로 컨텐츠들을 넣겠다는 것
//        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
//        child:
        body:Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hello'),
              Text('Hello'),
              Text('Hello'),
            ],
          ),
        ),
    );
  }
}
