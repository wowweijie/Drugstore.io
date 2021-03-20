import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:drugstore_io/model/Diagnosis.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';

// const String url = "localhost:8080";
const String url = "drugstore-node.et.r.appspot.com";
// const String url = "10.0.2.2:8080"

Future<List<Diagnosis>> fetchDiagnosis(String uid) async {
  final response = await http.get(
    Uri.https(url, '/diagnoses/', {'uid': uid}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var diagnoses = new List<Diagnosis>();
    Iterable diagnosisList = jsonDecode(response.body);
    diagnoses = diagnosisList
        .map((diagnosis) => Diagnosis.fromJson(diagnosis))
        .toList();
    return diagnoses;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load diagnoses');
  }
}

Future<http.Response> createDiagnosis(symptomsList, conditionDiagnosed) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  var uuid = Uuid();

  final response = await http.post(
    Uri.https(url, '/diagnoses/', {'id': uuid.v1()}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'user': auth.currentUser.uid.toString(),
      'symptoms': symptomsList,
      'condition': conditionDiagnosed["common_name"],
      'probability': conditionDiagnosed["probability"],
      'date': "${DateTime.now().toLocal()}".split(' ')[0],
      'approved': false,
      'id': uuid.v1(),
    }),
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to create diagnosis.');
  }
}
