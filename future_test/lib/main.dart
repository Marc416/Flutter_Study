import 'package:flutter/material.dart';

//메서드에 비동기 메서드임을 알려줌
void main() async {
  print('1.');
  //get메서드의 속성을 await기다릴것이다라는 것을 알려준다.
  print(await get('http://seasds.com'));

  print('3');

  //FutureGetTest futureGetTest = new FutureGetTest();

}

class FutureGetTest {

  FutureGetTest() {
    print('1/start');

    get('http://weasds.com').then((data) {
      print(data);
    });

    print('3.last');
    runApp(MyApp());
  }


}

//비동기로쓰일 메서드는 Future로 만들어 준다.
Future<String> get(String url) {
  return new Future.delayed(new Duration(seconds: 3), () {
    return '2.Igotit';
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
