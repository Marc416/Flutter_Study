import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/subway_arrival.dart' as arrival;
import 'api/subway_api.dart' as subway_api;


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //텍스트에디팅컨트롤러가 하는역할이 뭐지
  TextEditingController _stationController =
      TextEditingController(text: subway_api.defaultStation);

  //지하철 정보를 가져올 데이터 구조형으로 리스트 생성
  List<arrival.SubwayArrival> _data = [];
  bool _isLoading = false;

  //카드형 위젯(카드모양의 컨테이너라고 생각하면 됌)
  List<Card> _buildCards() {
//  로그 한번볼것 이게 무슨의미이지
    print('>>> _data.length? ${_data.length}');
    if (_data.length == 0) {
      //이형태는 뭐지
      return <Card>[];
    }

    List<Card> res = [];

    for (arrival.SubwayArrival info in _data) {
      Card card = Card(
        child: Column(
          children: [
            AspectRatio(
//            가로:세로의 비율(이미지 사이즈를 항상 같은 비율로 유지할 수 있게)
              aspectRatio: 2 / 1,
              child: Image.asset(
                'assets/icon/subway.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      info.trainLineNum,
                      maxLines: 1,
//                    글자가 한계를 넘어가면 생략한다. ellipsis->생략
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      info.arvlMsg2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      's23rwserwsdfsdfsdasdqwdsdfsdfasdqwexdfsdsdfsdfsdfsdasdasdf',
//                    텍스트 위젯이 한줄로 표현했을 때 볼수 있는 사이즈가 넘어가면 안보이게함
//                    맥스라인으로 몇줄을 보여줄건지 정할 수 있음
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      );
      res.add(card);
    }
    return res;
  }

  _onClick() {
    _getInfo();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getInfo();
  }

  _getInfo() async {
    setState(() {
      return _isLoading = true;
    });

    String station = _stationController.text;
    var response = await http.get(subway_api.buildUrl(station));
    String responseBody = response.body;
    print('res >> $responseBody');

    var json = jsonDecode(responseBody);
    Map<String, dynamic> errorMessage = json['errorMessage'];

    if (errorMessage['status'] != subway_api.STATUS_OK) {
      setState(() {
        final String errMessage = errorMessage['message'];
        print('error >> $errMessage');
        _data = const [];
        _isLoading = false;
      });
      return;
    }

    List<dynamic> realtimeArrivalLIst = json['realtimeArrivalList'];
    final int cnt = realtimeArrivalLIst.length;

    List<arrival.SubwayArrival> list = List.generate(cnt, (index) {
      Map<String, dynamic> item = realtimeArrivalLIst[index];
      return arrival.SubwayArrival(
        item['rowNum'],
        item['subwayId'],
        item['trainLineNm'],
        item['subwayHeading'],
        item['arvlMsg2'],
      );
    });

    setState(() {
      _data = list;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('지하철 실시간 정보'),
      ),
//    로딩중이면 if문 대신 이렇게 많이 쓰는가봄
      body: _isLoading
          ? Center(
//        프로그래스바
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: Row(
                    children: [
                      Text('역이름'),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          controller: _stationController,

                        ),
                      ),
                      Expanded(
                        child: SizedBox.shrink(),
                      ),
                      RaisedButton(
                        child: Text('조회'),
                        onPressed: _onClick,
                      )
                    ],
                  ),
                ),
//              조회블럭과의 거리를 두는 사이즈박스
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text('도착정보'),
                ),
//              expanded의 조상클래스
                Flexible(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: _buildCards(),
                  ),
                )
              ],
            ),
    );
  }
}
