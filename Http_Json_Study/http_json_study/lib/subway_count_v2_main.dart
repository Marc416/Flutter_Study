import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String _urlPrefix = 'http://swopenapi.seoul.go.kr/api/subway/';
const String _userKey = 'sample';
const String _urlSuffix = '/json/realtimeStationArrival/1/5/';
const String _defaultStation = '광화문';

const int STATUS_OK = 200;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

String result = '1';

//받아올 지하철 도착지 자료구조
class SubwayArrival {
  int _rowNum;
  String _subwayId;
  String _trainLineNm;
  String _subwayHeading;
  String _arvlMsg2;

  SubwayArrival(this._rowNum, this._subwayId, this._trainLineNm,
      this._subwayHeading, this._arvlMsg2);

  int get rowNum => _rowNum;

  String get subwayId => _subwayId;

  String get trainLineNum => _trainLineNm;

  String get subwayHeading => _subwayHeading;

  String get arvlMsg2 => _arvlMsg2;
}

class _MainPageState extends State<MainPage> {
  int _rowNum;
  String _subwayId;
  String _trainLineNm;
  String _subwayHeading;
  String _arvlMsg2;


//  공공데이터 json을 url로 읽어오기
  String _buildUrl(String station) {
    StringBuffer sb = StringBuffer();
    sb.write(_urlPrefix);
    sb.write(_userKey);
    sb.write(_urlSuffix);
    sb.write(station);
    return sb.toString();
  }

  _httpGet(String url) async {
    var response = await http.get(_buildUrl(_defaultStation));
    result = response.toString();
    String responseBody = response.body;
    print('res>>$responseBody');

    var json = jsonDecode(responseBody);
    Map<String, dynamic> errorMessage = json['errorMessage'];

    if (errorMessage['status'] <= STATUS_OK) {
      setState(() {
        final String errMessage = errorMessage['message'];
        _rowNum = 0;
        _subwayId = '';
        _trainLineNm = '';
        _subwayHeading = '';
        _arvlMsg2 = errMessage;
      });
      return;
    }


    List<dynamic> realtimeArrivalList = json['realtimeArrivalList'];
    final int cnt = realtimeArrivalList.length;

//  이게 무슨말일까
    List<SubwayArrival> list = List.generate(cnt, (int i) {
      Map<String, dynamic> item = realtimeArrivalList[i];
      return SubwayArrival(
        item['rowNum'],
        item['subwayId'],
        item['trainLineNm'],
        item['subwayHeading'],
        item['arvlMsg2'],
      );
    });

    SubwayArrival first = list[0];

    setState(() {
      _rowNum = first.rowNum;
      _subwayId = first.subwayId;
      _trainLineNm = first.trainLineNum;
      _subwayHeading = first.subwayHeading;
      _arvlMsg2 = first.arvlMsg2;

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _httpGet(_buildUrl(_defaultStation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('특정일특정역  지하철 승차인원'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//            Text(result),
            Text('rowNum: $_rowNum'),
            Text('subwayId : $_subwayId'),
            Text('trainLineNum : $_trainLineNm'),
            Text('subwayHeading : $_subwayHeading'),
            Text('arvlMsg2 : $_arvlMsg2'),
          ],
        ),
      ),
    );
  }
}
