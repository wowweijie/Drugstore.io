import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:drugstore_io/view/ChatPage.dart';
import 'dart:convert';
import 'package:recase/recase.dart';

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
  List<Map<String, String>> evidenceList;
  var baseIfmdURL;

  ChatManager._internal() {
    baseIfmdURL = "api.infermedica.com";
  }

  void getVirtualResponse(String text) async {
    final response = await http.post(
      Uri.https(baseIfmdURL, '/v3/parse'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'App-Id': 'f67b3ca6',
        'App-Key': '732ccef2bbef5d888a5451e6d6550177'
      },
      body: jsonEncode({
        "age": {"value": 30},
        "sex": "male",
        "text": text
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 SUCCESS response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      var interprete = jsonDecode(response.body);
      var mentions = interprete["mentions"];
      evidenceList = mentions
          .map<Map<String, String>>((mention) => {
                "id": mention["id"].toString(),
                "choice_id": mention["choice_id"].toString(),
                "source": "initial"
              })
          .toList();
      final questionResponse = await http.post(
        Uri.https(baseIfmdURL, '/v3/diagnosis'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'App-Id': 'f67b3ca6',
          'App-Key': '732ccef2bbef5d888a5451e6d6550177'
        },
        body: jsonEncode({
          "age": {"value": 30},
          "sex": "male",
          "evidence": evidenceList
        }),
      );
      if (questionResponse.statusCode == 200) {
        // If the server did return a 200 SUCCESS response,
        // then parse the JSON.
        ChatMessage questionMsg = ChatMessage(
            text: jsonDecode(questionResponse.body)["question"]["text"],
            name: "Dr Virtual",
            type: false);
        sendMsgWidgetCallback(questionMsg);
        List<Option> options = jsonDecode(questionResponse.body)["question"]
                ["items"]
            .map<Option>(((item) {
          return Option(id: item["id"], name: item["name"]);
        })).toList();
        sendMsgWidgetCallback(ChatOption(GlobalKey(), options));
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(jsonDecode(response.body));
      throw Exception(
          response.statusCode.toString() + 'Failed to connect to Infermedica');
    }
  }

  void getOntologyFromOption(Option option) async {
    evidenceList.add({"id": option.id, "choice_id": "present"});
    final response = await http.post(
      Uri.https(baseIfmdURL, '/v3/diagnosis'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'App-Id': 'f67b3ca6',
        'App-Key': '732ccef2bbef5d888a5451e6d6550177'
      },
      body: jsonEncode({
        "age": {"value": 30},
        "sex": "male",
        "evidence": evidenceList,
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 SUCCESS response,
      // then parse the JSON.
      var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
      if (responseBody["should_stop"]) {
        var conditionDiagnosed = responseBody["conditions"][0];
        ChatMessage diagnoseMsg = ChatMessage(
            text: "There is a " +
                conditionDiagnosed["probability"].toString() +
                "% chance that you have " +
                ReCase(conditionDiagnosed["common_name"].toString())
                    .sentenceCase,
            name: "Dr Virtual",
            type: false);
        sendMsgWidgetCallback(diagnoseMsg);
        return;
      }
      ChatMessage questionMsg = ChatMessage(
          text: responseBody["question"]["text"],
          name: "Dr Virtual",
          type: false);
      sendMsgWidgetCallback(questionMsg);
      List<Option> options =
          responseBody["question"]["items"].map<Option>(((item) {
        return Option(id: item["id"], name: item["name"]);
      })).toList();
      sendMsgWidgetCallback(ChatOption(GlobalKey(), options));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(jsonDecode(response.body));
      throw Exception(
          response.statusCode.toString() + 'Failed to connect to Infermedica');
    }
  }
}

class Option {
  String id;
  String name;

  Option({this.id, this.name});
}

typedef SingleWidgetFunction = void Function(Widget widget);
