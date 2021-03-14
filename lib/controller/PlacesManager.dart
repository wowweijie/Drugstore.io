import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:drugstore_io/googleMapData/place_response.dart';
import 'package:drugstore_io/googleMapData/result.dart';
import 'package:drugstore_io/googleMapData/error.dart';
import 'dart:ui' as ui;

class PlacesManager {
  static final PlacesManager _instance = PlacesManager._internal();

  factory PlacesManager() {
    return _instance;
  }

  var baseUrl;

  PlacesManager._internal() {
    baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
  }

  static const String _API_KEY = 'AIzaSyAcMYX4jTqaGBddJB64YDlk2QBzSp1lZag';

  List<Marker> markers = <Marker>[];
  Error error;
  List<Result> places;
  bool searching = true;
  String keyword;

  Uint8List healthcareIcon;
  Uint8List currentLocationIcon;

  void setCustomMapPin() async {
    healthcareIcon = await getBytesFromAsset('images/healthcare.png', 150);
    currentLocationIcon = await getBytesFromAsset('images/location.png', 150);
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

  void searchNearby(double latitude, double longitude) async {
    setCustomMapPin();
    markers.clear();
    // polylines.clear();

    String url =
        '$baseUrl?key=$_API_KEY&location=$latitude,$longitude&radius=1000&keyword=Pharmacy';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _handleResponse(data);
    } else {
      throw Exception('An error occurred getting places nearby');
    }

    searching = false;
  }

  void _handleResponse(data) {
    // bad api key or otherwise
    if (data['status'] == "REQUEST_DENIED") {
      error = Error.fromJson(data);
      // success
    } else if (data['status'] == "OK") {
      markers.add(
        Marker(
          markerId: MarkerId("ChIJyWMKn2kX2jERN5VPP5gkvzQ"),
          position: LatLng(1.3393865, 103.8476442),
          infoWindow: InfoWindow(title: "Current Location"),
          onTap: () {},
          icon: BitmapDescriptor.fromBytes(currentLocationIcon),
        ),
      );
      places = PlaceResponse.parseResults(data['results']);
      for (int i = 0; i < places.length; i++) {
        markers.add(
          Marker(
            markerId: MarkerId(places[i].placeId),
            position: LatLng(places[i].geometry.location.lat,
                places[i].geometry.location.long),
            infoWindow:
                InfoWindow(title: places[i].name, snippet: places[i].vicinity),
            onTap: () {},
            icon: BitmapDescriptor.fromBytes(healthcareIcon),
          ),
        );
      }
    } else {
      print(data);
    }
  }

  // // Object for PolylinePoints
  // PolylinePoints polylinePoints;

  // // List of coordinates to join
  // List<LatLng> polylineCoordinates = [];

  // // Map storing polylines created by connecting two points
  // Map<PolylineId, Polyline> polylines = {};

  // // Create the polylines for showing the route between two places

  // _createPolylines(double startLat, double startLong, double destinationLat,
  //     double destinationLong) async {
  //   // Initializing PolylinePoints
  //   polylinePoints = PolylinePoints();

  //   // Generating the list of coordinates to be used for
  //   // drawing the polylines
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     "AIzaSyAcMYX4jTqaGBddJB64YDlk2QBzSp1lZag", // Google Maps API Key
  //     PointLatLng(startLat, startLong),
  //     PointLatLng(destinationLat, destinationLong),
  //     travelMode: TravelMode.transit,
  //   );

  //   // Adding the coordinates to the list
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   }

  //   // Defining an ID
  //   PolylineId id = PolylineId('poly');

  //   // Initializing Polyline
  //   Polyline polyline = Polyline(
  //     polylineId: id,
  //     color: Colors.red,
  //     points: polylineCoordinates,
  //     width: 3,
  //   );

  //   // Adding the polyline to the map
  //   polylines[id] = polyline;
  // }
}
