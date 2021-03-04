import 'package:drugstore_io/model/UserProfile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountManager {
  static registerUser(String uid, UserProfile user) async {
    final response = await http.post(
      Uri.http('10.0.2.2:8080', '/users/new_usr', {'uid': uid}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': user.name,
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("User profile captured...");
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.statusCode.toString() + 'Failed to load album');
    }
  }
}

Future<UserProfile> fetchProfile(String uid) async {
  final response = await http.get(
    Uri.http('10.0.2.2:8080', '/users/', {'uid': uid}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserProfile.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load profile');
  }
}

Future<http.Response> createProfile(String uid, username) async {
  final response = await http.post(
    Uri.http('10.0.2.2:8080', '/users/', {'uid': uid}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': "",
      'username': username,
      'gender': "",
      'birthday': "",
      'height': "",
      'weight': "",
      'bloodType': "",
      'ethnicity': "",
      'allergies': ["NIL"],
      'existingMedCond': ["NIL"],
      'famMedHist': ["NIL"],
      'personalMedHist': ["NIL"]
    }),
  );

  if (response.statusCode == 201) {
    return response;
  } else {
    throw Exception('Failed to create profile.');
  }
}

Future<http.Response> updateProfile(
    String uid,
    name,
    username,
    gender,
    birthday,
    height,
    weight,
    bloodType,
    ethnicity,
    List<dynamic> allergies,
    existingMedCond,
    famMedHist,
    personalMedHist) async {
  final response = await http.put(
    Uri.http('10.0.2.2:8080', '/users/', {'uid': uid}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': name,
      'username': username,
      'gender': gender,
      'birthday': birthday,
      'height': height,
      'weight': weight,
      'bloodType': bloodType,
      'ethnicity': ethnicity,
      'allergies': allergies,
      'existingMedCond': existingMedCond,
      'famMedHist': famMedHist,
      'personalMedHist': personalMedHist
    }),
  );
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to update profile.');
  }
}
