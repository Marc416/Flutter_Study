import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String header='''
{"row":
  {
  "USE_DT":"20151101",
            "LINE_NUM":"1호선",
            "SUB_STA_NM":"종로5가",
            "RIDE_PASGR_NUM":12945.0,
            "ALIGHT_PASGR_NUM":13012.0,
            "WORK_DT":"20151203"
  }

}
''';

void main() {
//  runApp(SubwayPeopleCount());


}

class SubwayPeopleCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 승하차 정보',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  static const String _urlPrefix = 'http://openapi.seoul.go.kr:8088/';
  static const String _userKey = '414e6d58456a756e31303750414d4574';
  static const String _urlSuffix = '/json/CardSubwayStatsNew/1/5/';
  static const String _defaultDay = '20151101';

  String _response = '';

//  url 읽어오기
  String _buildUrl(String date){
    StringBuffer sb = StringBuffer();
    sb.write(_urlPrefix);
    sb.write(_userKey);
    sb.write(_urlSuffix);
    sb.write(date);
    return sb.toString();
  }

  _httpGet(String url) async{
    var response = await http.get(_buildUrl(_defaultDay));
    String res = response.body;
    print('res>>$res');
    setState(() {
      _response = res;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _httpGet(_buildUrl(_defaultDay));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('특정일특정역  지하철 승차인원'),
      ),
      body: Center(
        child: Text(_response),
      ),
    );
  }
}




//  var parsed = jsonDecode(header);
//  Map<String, dynamic> useDT = parsed['row'];
//
//
//  print('USE_DT: ${useDT['USE_DT']}');
//  print('LINE_NUM: ${useDT['LINE_NUM']}');
//  print('SUB_STA_NM: ${useDT['SUB_STA_NM']}');
//  print('RIDE_PASGR_NUM: ${useDT['RIDE_PASGR_NUM']}');
//  print('ALIGHT_PASGR_NUM: ${useDT['ALIGHT_PASGR_NUM']}');
//  print('WORK_DT: ${useDT['WORK_DT']}');
