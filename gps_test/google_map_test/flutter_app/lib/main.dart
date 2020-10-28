import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  static bool isTracking = false;
  Marker marker;
  String googleApiKey = 'AIzaSyBkMU0TOgcIy9i1PbJ2FNLXXuZNukV0AaI';
  List<LatLng> _points = List<LatLng>();
  Set<Polyline> _polylines = Set<Polyline>();
  Set<Circle> _circles = Set.from([
    Circle(circleId: CircleId('Main'), visible: false, fillColor: Colors.red)
  ]);

  ///Todo 처음 타겟 장소는 핸드폰 내에 남아 있는 최종 좌표를 불려와서 보여준다.
  ///가능하면! 아마 될듯
  LatLng _initialcameraposition = LatLng(37.264842, 126.96033);
  GoogleMapController _controller;

  //키자마자 내위치 로가게 하기

//  이 로케이션 메서드는 어디서 나온것이고 무슨 역할을 하는 것일까
  Location _location = Location();
  Future<LocationData> _locationData;
  StreamSubscription<LocationData> _locationSubscription;

  Future<void> _onMapCreated(GoogleMapController _cntlr) async {
    _controller = _cntlr;
    _locationSubscription = _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 19),
        ),
      );
      _points.add(_initialcameraposition);
      _points.add(LatLng(l.latitude, l.longitude));
      setState(() {
        _polylines.add(Polyline(
          polylineId: PolylineId('0'),
          points: _points,
          color: Colors.red,
//            width: 10
        ));
      });
      _stopListen(_controller);
//      ShowCurrentPos(_locationData);
    });
  }

  Future<void> _startListen(GoogleMapController _cntlr) async {
    int i = 0;
    _controller = _cntlr;
    if (isTracking == true) {
      _locationSubscription = _location.onLocationChanged.listen((l) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 19),
          ),
        );

        _points.add(LatLng(l.latitude, l.longitude));
        _polylines.add(Polyline(
          polylineId: PolylineId('0'),
          points: _points,
          color: Colors.red,
//            width: 10
        ));
        print(i+=1);
      });
    }
  }

  // locationData 끊기 (gps추적 x)
  Future<void> _stopListen(GoogleMapController _cntrl) async {
    _locationSubscription.cancel();
    _controller = _cntrl;

    _locationData = _location.getLocation();
    double latitude;
    double longitude;
    await _locationData.then((value) {
      latitude = value.latitude;
      longitude = value.longitude;
    });
//    _controller.animateCamera(CameraUpdate.newCameraPosition(
//      CameraPosition(target: LatLng(latitude, longitude), zoom: 19),
//    ));
    print('here, $latitude, $longitude');
    LatLng latLng = LatLng(latitude, longitude);
    ShowCurrentPos(latLng);

//    _points.clear();
  }

  //마커라는 셋 자료구조 생성
  Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
    _markers.add(
        //하드코딩으로 마커위젯하나를 추가
        Marker(
      markerId: MarkerId('myPosition'),
      position: LatLng(37.5665802, 126.9173289),
      infoWindow:
          InfoWindow(title: 'here Is Init Pos', snippet: 'where am i?snippet'),
    ));
  }

  GlobalKey _formKey = GlobalKey<FormState>();

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
//                circles: Set.of((marker != null)? [circle] : []),
//                markers: Set.of((marker != null)? [marker] : []),
              myLocationButtonEnabled: false,
              myLocationEnabled: isTracking,
              onTap: (argument) {
                if (isTracking == false) {
                  setState(() {
                    _setCircle(argument);
                  });
                }
              },
              markers: _markers,
              polylines: _polylines,
              circles: _circles,
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: RaisedButton(
                onPressed: () {
                  Trackable();
                  print('istracking : $isTracking');
                },
//            ToDo 아이콘 위치 바꾸기
                child: Icon(Icons.gps_not_fixed),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text('hey'),
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .5,
                  vertical: MediaQuery.of(context).size.height * .5),
//              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width *.5, MediaQuery.of(context).size.height *.86, 0, 0 ),
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderDropdown(
                      attribute: 'paceId',
                      hint: Text('어떤장소를 원하세요?'),
                      decoration: InputDecoration(
                          filled: true,
                          labelText: '장소',
                          border: OutlineInputBorder()),
                      validators: [
                        FormBuilderValidators.required(
                            errorText: '장소 선택은 필수_에러텍스트'),
                      ],
//                      items: places,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool Trackable() {
    setState(() {
      if (isTracking == true) {
        isTracking = false;
        showMypos = true;
        _stopListen(_controller);
      } else {
        isTracking = true;
        showMypos = false;
//        _onMapCreated(_controller);
        _startListen(_controller);
        //todo
      }
    });
  }

  Circle circle;
  bool showMypos = false;

  void ShowCurrentPos(LatLng latlng) {
    print('imhere, $latlng');
//    LatLng latlng = LatLng(newLocationData.latitude, newLocationData.longitude);
    setState(() {
      circle = Circle(
          circleId: CircleId('myPos'),
          center: latlng,
          visible: true,
          zIndex: 0,
          radius: 20,
          strokeColor: Colors.blue,
          fillColor: Colors.black.withAlpha(70));
    });
  }

  void _setCircle(LatLng latlng) {
    circle = Circle(
        circleId: CircleId('myPos'),
//        center: latlng,
        visible: true,
        zIndex: 0,
        radius: 20,
        strokeColor: Colors.blue,
        fillColor: Colors.black.withAlpha(70));
  }
}
