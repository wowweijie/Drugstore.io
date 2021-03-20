import 'package:drugstore_io/model/Notif.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String url = "drugstore-node.et.r.appspot.com";

Future<List<Notif>> fetchNotifs(String uid) async {
  final response = await http.get(
    Uri.https(url, '/notifs/', {'uid': uid}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var notifs = new List<Notif>();
    Iterable notifsList = jsonDecode(response.body);
    notifs = notifsList.map((notif) => Notif.fromJson(notif)).toList();
    return notifs;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load notifs');
  }
}
