import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:drugstore_io/view/ChatPage.dart';
import 'dart:convert';

class ChatManager {
  static final ChatManager _instance = ChatManager._internal();

  factory ChatManager.setMessageListener(
      SingleWidgetFunction sendMsgWidgetCallback) {
    _instance.sendMsgWidgetCallback = sendMsgWidgetCallback;
    return _instance;
  }

  factory ChatManager() {
    return _instance;
  }

  SingleWidgetFunction sendMsgWidgetCallback;
  var baseIfmdURL;

  ChatManager._internal() {
    baseIfmdURL = "https://api.infermedica.com/v3";
  }

  void generateVirtualResponse(String text) async {
    final response = await http.post(
      Uri.https(baseIfmdURL, '/parse'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'App-Id' : 'f67b3ca6',
        'App-Key' : '732ccef2bbef5d888a5451e6d6550177'
      },
      body: jsonEncode({
        'text': text,
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body).mentions);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(
          response.statusCode.toString() + 'Failed to connect to Infermedica');
    }
  }
}

typedef SingleWidgetFunction = void Function(Widget widget);
