import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:drugstore_io/googleMapData/place_response.dart';
import 'package:drugstore_io/googleMapData/result.dart';
import 'package:drugstore_io/googleMapData/error.dart';

const String baseUrl =
    "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
const String _API_KEY = 'AIzaSyAcMYX4jTqaGBddJB64YDlk2QBzSp1lZag';

Future<List<Marker>> searchNearby(
    double latitude,
    double longitude,
    currentLocationIcon,
    healthcareIcon) async {
  List<Marker> markers = <Marker>[];
  Error error;
  List<Result> places;

  markers.clear();

  markers.add(
        Marker(
          markerId: MarkerId("ChIJyWMKn2kX2jERN5VPP5gkvzQ"),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(title: "Current Location"),
          onTap: () {},
          icon: BitmapDescriptor.fromBytes(currentLocationIcon),
        ),
      );

  String url =
      '$baseUrl?key=$_API_KEY&location=$latitude,$longitude&radius=1000&keyword=Pharmacy';

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    // bad api key or otherwise
    if (data['status'] == "REQUEST_DENIED") {
      error = Error.fromJson(data);
      print(error);
      // success
    } else if (data['status'] == "OK") {
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
      return markers;
    } else {
      print(data);
    }
  } else {
    throw Exception('An error occurred getting places nearby');
  }
  return markers;
}

// Future<Map<PolylineId, Polyline>> _createPolylines(double startLat,
//     double startLong, double destinationLat, double destinationLong) async {
//   // Object for PolylinePoints
//   PolylinePoints polylinePoints;

//   // // List of coordinates to join
//   List<LatLng> polylineCoordinates = [];

//   // // Map storing polylines created by connecting two points
//   Map<PolylineId, Polyline> polylines = {};

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
//   return polylines;
// }
