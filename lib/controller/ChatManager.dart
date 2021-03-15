import 'package:drugstore_io/view/chat/Diagnosis.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:drugstore_io/view/chat/ChatPage.dart';
import 'dart:convert';
import 'package:recase/recase.dart';
import 'package:drugstore_io/controller/DiagnosisManager.dart';

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
  List<dynamic> symptomsList = [];
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
      symptomsList = mentions
          .map(
            (mention) => mention["common_name"].toString(),
          )
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
        if (options.length == 1) {
          List<Option> yesNoList = new List<Option>(2);
          yesNoList[0] = new Option(id: options[0].id, name: "Yes");
          yesNoList[1] = new Option(id: options[0].id, name: "No");
          yesNoList[1].present = false;
          sendMsgWidgetCallback(ChatOption(GlobalKey(), yesNoList));
        } else {
          sendMsgWidgetCallback(ChatOption(GlobalKey(), options));
        }
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
    String presentOrAbsent = option.present ? "present" : "absent";
    evidenceList.add({"id": option.id, "choice_id": presentOrAbsent});
    print(option.name);
    print("evidenceList : $evidenceList");
    if ((option.name != 'None of the above') & (option.name != 'No')) {
      symptomsList.add(option.name);
    }
    print(symptomsList);
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
        DiagnosisResult diagnoseMsg = DiagnosisResult(
            condition:
                ReCase(conditionDiagnosed["common_name"].toString()).titleCase,
            chance:
                (conditionDiagnosed["probability"] * 100).round().toString(),
            name: "Dr Virtual");
        sendMsgWidgetCallback(diagnoseMsg);
        createDiagnosis(symptomsList, conditionDiagnosed);
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
      if (options.length == 1) {
        List<Option> yesNoList = new List<Option>(2);
        yesNoList[0] = new Option(id: options[0].id, name: "Yes");
        yesNoList[1] = new Option(id: options[0].id, name: "No");
        yesNoList[1].present = false;
        sendMsgWidgetCallback(ChatOption(GlobalKey(), yesNoList));
      } else {
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

  void sendUserMessage(String text) {
    sendMsgWidgetCallback(ChatMessage(name: "Me", text: text, type: true));
  }
}

class Option {
  String id;
  String name;
  bool present = true;

  Option({this.id, this.name});
}

typedef SingleWidgetFunction = void Function(Widget widget);
