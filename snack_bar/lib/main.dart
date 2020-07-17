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
        body: Builder(
          builder: (BuildContext ctx) {
            return Center(
              child: FlatButton(
                child: Text(
                  'Show me',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {
                  //코딩쉐프 강좌 순한맛 18강 보기 scaffold of에관해
                  ///스낵바는 Scaffold.of<- 이 of의 메소드의 매개변수를 가지는
                  ///buildContext를 찾고 그걸 기점으로 위로 올라가면서
                  ///Scaffold를 찾는다. 그래서 센터위에 바디를 빌드를 해서
                  ///BuildContext를 만들어 준 것임. 이부분은 추후에
                  ///구글에서 수정을 할거같다.
                  Scaffold.of(ctx).showSnackBar(SnackBar(
                    content: Text('Hellow'),
                  ));
                },
              ),
            );
          },
        ));
  }
}
