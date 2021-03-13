import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:drugstore_io/model/Prescription.dart';

Future<List<Prescription>> fetchPrescription(String uid) async {
  final response = await http.get(
    Uri.http('10.0.2.2:8080', '/prescriptions/', {'uid': uid}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var prescriptions = new List<Prescription>();
    Iterable prescriptionsList = jsonDecode(response.body);
    prescriptions = prescriptionsList
        .map((prescription) => Prescription.fromJson(prescription))
        .toList();
    return prescriptions;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load prescriptions');
  }
}
