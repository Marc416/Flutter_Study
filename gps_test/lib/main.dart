import 'package:flutter/material.dart';
import 'package:gps_test/permission_status.dart';

import 'listen_location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: GetLocation(),
    );
  }
}

class GetLocation extends StatefulWidget {
  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  String location = 'location is not detected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocationTest'),
      ),
      body: Column(
        children: <Widget>[
          Text(location),
          RaisedButton(
            child: Text('GetLocation'),
            onPressed: () {
              print('pushed');
            },
          ),
          PermissionStatusWidget(),
          ListenLocationWidget()
        ],
      ),
    );
  }
}
