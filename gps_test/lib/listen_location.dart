import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class ListenLocationWidget extends StatefulWidget {
  const ListenLocationWidget({Key key}) : super(key: key);

  @override
  _ListenLocationState createState() => _ListenLocationState();
}

class _ListenLocationState extends State<ListenLocationWidget> {
  final Location location = Location();

  LocationData _location;
  StreamSubscription<LocationData> _locationSubscription;
  String _error;

  Future<void> _listenLocation() async {
    _locationSubscription =
        location.onLocationChanged.handleError((dynamic err) {
          setState(() {
            _error = err.code;
          });
          _locationSubscription.cancel();
        }).listen((LocationData currentLocation) {
          setState(() {
            _error = null;

            _location = currentLocation;
          });
        });
  }

  Future<void> _stopListen() async {
    _locationSubscription.cancel();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        IconButton(
          icon: (isGps ? Icon(Icons.gps_fixed) : Icon(Icons.gps_not_fixed)),
          onPressed: (){
            gPSToggleStatus();
          },
        ),
      ],
    );
  }

  void gPSToggleStatus() {
    setState(() {
      if(isGps){
        isGps = false;
        _stopListen();
      }
      else{
        isGps = true;
        _listenLocation();
      }
      print(isGps);
    });
  }
}


//static으로 만들고 싶은데 어떻게 해야할지 모르겟음
bool isGps= false;

