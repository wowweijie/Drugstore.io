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
        'email': user.email,
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

  static getUser(String uid) async {
    final response = await http.get(
      Uri.http('10.0.2.2:8080', '/users/' + uid),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("User profile received...");
      print(jsonDecode(response.body));
      // UserProfile user = new UserProfile(response.body, response.body);
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.statusCode.toString() + 'Failed to load album');
    }
  }
}
