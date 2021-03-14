import 'dart:async';
import 'package:drugstore_io/controller/PlacesManager.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class NearestHealthcareMap extends StatefulWidget {
  @override
  _NearestHealthcareMapState createState() => _NearestHealthcareMapState();
}

class _NearestHealthcareMapState extends State<NearestHealthcareMap> {
  PlacesManager placesManager = PlacesManager();
  Position _currentPosition;
  double lat = 1.335850;
  double long = 103.856420;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    placesManager.searchNearby(lat, long);
  }

  static const LatLng _center = const LatLng(1.335850, 103.856420);

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image(
            image: new AssetImage("images/drugstore.io_text.png"),
            fit: BoxFit.fitHeight,
            height: 35,
          ),
          backgroundColor: Color(0xffe2eeff),
          leading: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 26.0,
                  color: Colors.black,
                ),
              )),
        ),
        body: Stack(children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
                mapController = controller;
            },
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              // target: LatLng(
              //     _currentPosition.latitude,
              //     _currentPosition.longitude),
              target: _center,
              zoom: 16,
            ),
            markers: Set<Marker>.of(placesManager.markers),
          ),
          // Show zoom buttons
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          // Show current location button
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                child: ClipOval(
                  child: Material(
                    color: Colors.blue[100], // button color
                    child: InkWell(
                      splashColor: Colors.blue, // inkwell color
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(Icons.my_location),
                      ),
                      onTap: () {
                        mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(
                                lat,
                                long,
                              ),
                              zoom: 16.0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}
