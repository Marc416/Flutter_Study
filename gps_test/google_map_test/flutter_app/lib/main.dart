import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
bool isTracking = false;
LocationData publicLocationData;
class _MyHomePageState extends State<MyHomePage> {
  ///Todo 처음 타겟 장소는 핸드폰 내에 남아 있는 최종 좌표를 불려와서 보여준다.
  ///가능하면! 아마 될듯
  LatLng _initialcameraposition = LatLng(37.264842, 126.96033);
  GoogleMapController _controller;
//  이 로케이션 메서드는 어디서 나온것이고 무슨 역할을 하는 것일까
  Location _location = Location();
  LocationData _locationData;
  StreamSubscription<LocationData> _locationSubscription;
  GoogleMap _googleMap;
//  static bool isTracking = false;

  Future<void> _onMapCreated(GoogleMapController _cntlr) {
    print('comein');
    _controller = _cntlr;
    //  TODO 지속적인 위치트랙킹이 필요한 러닝 시에만 동작할것(onlocation Change)
    if (isTracking == true) {
      _locationSubscription = _location.onLocationChanged.listen((l) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 19),
          ),
        );
      });
    } else {
      print('stop');
      _locationSubscription.cancel();
    }
  }

  Set<GoogleMap> _setGoogleMap() {
    var tmp = Set<GoogleMap>();
    tmp.clear();
  }

  void _onMapMove(GoogleMapController _cntlr) {}
  Future<void> _listenLocation() async{

  }
  Future<void> _stopListen() async{
    _locationSubscription.cancel();

  }
  void GPSToggleStatus(){
    setState(() {
      if(isTracking)
        _listenLocation();
      else
        _stopListen();


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _initialcameraposition, zoom: 14),
                mapType: MapType.normal,
//              TODO 특정 시작 버튼이나 지금 장소 트랙킹하는 버튼 누르면 현재위치 나오게
                onMapCreated: _onMapCreated,
//                myLocationButtonEnabled: false,

                myLocationEnabled: isTracking
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    if (isTracking == true) {
                      isTracking = false;
                      _stopListen();
  //                    _controller.
                    } else {
                      isTracking = true;
                      _onMapCreated(_controller);
                    }

                  });
                  print('istracking : $isTracking');
                },
//            ToDo 아이콘 위치 바꾸기
                child: Icon(Icons.gps_not_fixed),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool Trackable() {
    setState(() {
      if (isTracking)
        return true;
      else
        //여기넣어보는방법
        return false;
    });
  }
}
