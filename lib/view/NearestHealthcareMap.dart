import 'dart:async';
import 'dart:typed_data';
import 'package:drugstore_io/controller/PlacesManager.dart';
import 'package:drugstore_io/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:ui' as ui;

class NearestHealthcareMap extends StatefulWidget {
  final Position currentPosition;
  NearestHealthcareMap({@required this.currentPosition});
  @override
  _NearestHealthcareMapState createState() =>
      _NearestHealthcareMapState(currentPosition);
}

class _NearestHealthcareMapState extends State<NearestHealthcareMap> {
  _NearestHealthcareMapState(this.currentPosition);
  // PlacesManager placesManager = PlacesManager();
  Position currentPosition;
  double lat = 1.3393865;
  double long = 103.8476442;
  Position _currentPosition;
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

  Future<List<Marker>> futureMarkers;
  List<Marker> markers;

  Uint8List healthcareIcon;
  Uint8List currentLocationIcon;

  void setMap() async {
    healthcareIcon = await getBytesFromAsset('images/healthcare.png', 150);
    currentLocationIcon = await getBytesFromAsset('images/location.png', 150);
    futureMarkers = searchNearby(currentPosition.latitude,
        currentPosition.longitude, currentLocationIcon, healthcareIcon);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    setMap();
  }

  static const LatLng _center = const LatLng(1.3393865, 103.8476442);

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MyBottomNavigationBar(
                              key: GlobalKey(), selectedIndex: 0)));
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 26.0,
                  color: Colors.black,
                ),
              )),
        ),
        body: FutureBuilder<List<Marker>>(
          future: futureMarkers,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              markers = snapshot.data;
              print("markers");
              return Stack(children: <Widget>[
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  myLocationButtonEnabled: false,
                  myLocationEnabled: false,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        currentPosition.latitude, currentPosition.longitude),
                    // target: _center,
                    zoom: 16,
                  ),
                  markers: Set<Marker>.of(markers),
                  // polylines: Set<Polyline>.of(polylines.values),
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
                                      currentPosition.latitude,
                                      currentPosition.longitude,
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
              ]);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          },
        ));
  }
}
