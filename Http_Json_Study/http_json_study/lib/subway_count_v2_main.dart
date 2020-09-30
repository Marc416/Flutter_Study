import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String _urlPrefix = 'http://openapi.seoul.go.kr:8088/';
const String _userKey = '414e6d58456a756e31303750414d4574';
const String _urlSuffix = '/json/CardSubwayStatsNew/1/5/';
const String _defaultDay = '20151101';

const int STATUS_OK = 200;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class SubwayPeopleCount {
  int _use_dt;
  String _line_num;
  String _sub_sta_nm;
  double _ride_pasgr_num;
  double _alight_pasgr_num;
  int _work_dt;

  SubwayPeopleCount(this._use_dt, this._line_num, this._sub_sta_nm,
      this._ride_pasgr_num, this._alight_pasgr_num, this._work_dt);

  int get useDate => _use_dt;

  String get lineNum => _line_num;

  String get subStaNm => _sub_sta_nm;

  double get ridePasgrNum => _ride_pasgr_num;

  double get alightPasgrNum => _alight_pasgr_num;

  int get workDt => _work_dt;
}

class _MainPageState extends State<MainPage> {
  int _use_dt;
  String _line_num;
  String _sub_sta_nm;
  double _ride_pasgr_num;
  double _alight_pasgr_num;
  int _work_dt;

  String _response = '';

//  url 읽어오기
  String _buildUrl(String date) {
    StringBuffer sb = StringBuffer();
    sb.write(_urlPrefix);
    sb.write(_userKey);
    sb.write(_urlSuffix);
    sb.write(date);
    return sb.toString();
  }

  _httpGet(String url) async {
    var response = await http.get(_buildUrl(_defaultDay));
    String responseBody = response.body;
    print('res>>$responseBody');

    var json = jsonDecode(responseBody);
    Map<String, dynamic> totalCount = json['CardSubwayStatsNew']['row'];

    if (totalCount['list_total_count'] <= 0) {
      setState(() {
        final String errMessage = totalCount['message'];
        _use_dt = 0;
        _line_num = '';
        _sub_sta_nm = '';
        _ride_pasgr_num = 0;
        _work_dt = 0;
      });
      return;
    }

    setState(() {
      _response = responseBody;
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
