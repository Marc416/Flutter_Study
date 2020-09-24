import 'package:django_quiz/model/model_quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //퀴즈더미데이터 생성

  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test,',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test,',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test,',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    })
  ];

  @override
  Widget build(BuildContext context) {
    //기기의 스크린 크기에 대한 정보?!를 가져올 수 있음
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    //SafeArea는 모바일 화면 크기의 안전한 사이즈를 확보하겠다는 이야기임
    //이거설정하니까 위의 상단 시간  배터리 바를 침범안해서 좋긴한데 침범하는게 좀더 간지나 보임임
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
          backgroundColor: Colors.deepPurple,
          leading: Container(), //앱바생성시 뒤로가기 버튼을 가릴 때 좋음
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/profile.jpg',
                width: width * .8,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            Text(
              '플러터 퀴즈앱',
              style: TextStyle(
                  fontSize: width * 0.065, fontWeight: FontWeight.bold),
            ),
            Text(
              '퀴즈를 풀기 전 안내사항 입니다. \n꼼꼼히 읽고 퀴즈 풀기를 눌러주세요',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요'),
            _buildStep(width, '2. 문제를 읽고 정답을 고른뒤 \n다음 문제버튼을 눌러주세요'),
            _buildStep(width, '3. 만점을 향해 도전해 보세요'),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RaisedButton(
                    child: Text(
                      '지금 퀴즈풀기',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                    onPressed: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(),
          ),
          Text(title)
        ],
      ),
    );
  }
}
