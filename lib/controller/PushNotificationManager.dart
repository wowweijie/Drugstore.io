import 'package:drugstore_io/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) {
    print('on background $message');
  }

  Future<void> init(navigatorKey) async {
    // if (!_initialized) {
    // For iOS request permission first.

    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure(
        onLaunch: (Map<String, dynamic> message) {
          print('onLaunch called');
        },
        onResume: (Map<String, dynamic> message) {
          print('onResume called');
          Navigator.push(
              navigatorKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => MyBottomNavigationBar(
                      key: GlobalKey(), selectedIndex: 0)));
        },
        onMessage: (Map<String, dynamic> message) {
          print('onMessage called');
        },
        onBackgroundMessage: myBackgroundMessageHandler);

    // For testing purposes print the Firebase Messaging token
    String token = await _firebaseMessaging.getToken();
    print("FirebaseMessaging token: $token");

    _initialized = true;

    // }
  }
}
