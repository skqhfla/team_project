import 'dart:async';

import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'mypage.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _search = TextEditingController();
  Location currentLocation = Location();
  Set<Marker> _markers={};

  double currentLatitude = 0;
  double currentLongitude = 0;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position =
    await Geolocator.getCurrentPosition();
    currentLatitude = position.latitude;
    currentLongitude = position.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.yellow[100],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: '동네 검색',
                hintStyle: TextStyle(
                    fontSize: 15
                ),
              ),
              controller: _search,
            ),
            SizedBox(height: 50,),
            Container(
                height: 400,
                child: currentLatitude != 0 && currentLongitude !=0 ?
                GoogleMap(
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                          currentLatitude,
                          currentLongitude
                        ),
                      zoom: 18,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                ) :
                Text('loading')

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching,color: Colors.white,),
        onPressed: (){
          setState(() {
            getLocation();
          });
        },
      ),
    );
  }
}
