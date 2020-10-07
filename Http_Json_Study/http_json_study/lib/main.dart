import 'dart:convert';
import 'subway_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(SubwayPeopleCount());
}

class SubwayPeopleCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 승하차 정보',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}


