import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,    //  디버그 로고 없애는법
      title: 'BBANTO',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text('BBANTO'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
        child: Column(
          //crossAxisAlignment : 가로정렬을 할건데 시작 점 부터 정렬을 시작할 것이다라는 말임.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                //AssetImage- Yaml에 등록한 이미지 경로를 텍스트로 적어준다-> 이거 엄청 불편하네
                backgroundImage: AssetImage('assets/jooni.png'),
                radius: 60.0,
              ),
            ),
            Divider(// 앱내의 경계를 알려주기위한 디바이더 선이라고 볼 수 있음
              //디바이더의 위 아래 또는 양옆의 컨테스트들의 떨어진 거리라고 볼 수 잇음.
              //위 아래로 30씩 떨어진 곳에 위치하겠다는 것임
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,//선의 두께를 지정
              endIndent: 30 ,//디바이더 선이 끝에서부터(오른쪽) 어느정도 떨어져야 하는지 알려주는 것임
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              //위아래 두 글자의 간격을 벌려주기 위해 눈에 보이지 않는 박스를 넣어준다
              height: 10.0,
            ),
            Text(
              'BBANTO',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0, //글자 가로 간격
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold //글자의 굵기를 적용
                  ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Banto Power Level',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              //위아래 두 글자의 간격을 벌려주기 위해 눈에 보이지 않는 박스를 넣어준다
              height: 10.0,
            ),
            Text(
              '14',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0, //글자 가로 간격
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold //글자의 굵기를 적용
                  ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'using lightsaber',
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'face hero tatto',
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'fire flames',
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                )
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/jooni.png'),
                radius:40.0,
                backgroundColor: Colors.amber[500],
              ),
            )
          ],
        ),
      ),
    );
  }
}
