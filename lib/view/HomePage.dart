import 'dart:math';

import 'package:drugstore_io/controller/DiagnosisManager.dart';
import 'package:drugstore_io/controller/NotificationManager.dart';
import 'package:drugstore_io/controller/PrescriptionManager.dart';
import 'package:drugstore_io/main.dart';
import 'package:drugstore_io/model/Notif.dart';
import 'package:drugstore_io/model/Prescription.dart';
import 'package:geolocator/geolocator.dart';
import 'package:list_expandable/list_expandable_widget.dart';
import 'package:drugstore_io/view/eventsPage/EditProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:expandable_group/expandable_group_widget.dart';
import 'package:drugstore_io/model/Diagnosis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:drugstore_io/view/NearestHealthcareMap.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _latestPrescription = ["Paracetamol 75mg", "Antacid 50mg"];
  List<String> _reminderList = [];
  List<String> _healthTips = [
    "Eat a variety of foods.",
    "Base your diet on plenty of foods rich in carbohydrates.",
    "Replace saturated with unsaturated fat.",
    "Enjoy plenty of fruits and vegetables.",
    "Reduce salt and sugar intake.",
    "Eat regularly, control the portion size.",
    "Drink plenty of fluids.",
    "Maintain a healthy body weight.",
    "Get on the move, make it a habit!",
    "Start now! And keep changing gradually."
  ];
  List<String> _diagnosisAppList = [];
  List<String> _prescReqList = [];

  List<ListTile> _buildItems(
          BuildContext context, List<dynamic> items, bool records) =>
      items
          .map((e) => ListTile(
                onTap: () {
                  if (records) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MyBottomNavigationBar(
                                key: GlobalKey(), selectedIndex: 2)));
                  }
                },
                title: Text(e),
                tileColor: records ? Colors.transparent : Colors.white,
              ))
          .toList();

  List<ListTile> _buildItemsPrescription(
          BuildContext context, List<dynamic> items) =>
      items
          .map((e) => ListTile(
                title:
                    Text(e['name'] + ' ' + e['dosage'] + ' ' + e['frequency']),
              ))
          .toList();

  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<Diagnosis>> futureDiagnosis;
  List<Diagnosis> userDiagnoses;

  Future<List<Prescription>> futurePrescription;
  List<Prescription> userPrescriptions;

  Future<List<Notif>> futureNotifs;
  List<Notif> userNotifs;

  Position _currentPosition;
  double lat = 1.3393865;
  double long = 103.8476442;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    futureDiagnosis = fetchDiagnosis(auth.currentUser.uid.toString());
    futurePrescription = fetchPrescription(auth.currentUser.uid.toString());
    futureNotifs = fetchNotifs(auth.currentUser.uid.toString());
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/HomePage_Background.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Center(
                    child: Container(
                      child: Image(
                        image: new AssetImage("images/HomePage_Image.png"),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffb5cbec),
                  ),
                  height: 50,
                  width: 240,
                  child: Text(
                    "Welcome to Drugstore.io!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                  height: 120,
                  //width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("hi");
                                print(_currentPosition);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => NearestHealthcareMap(
                                            currentPosition:
                                                Position(latitude: 1.3396, longitude: 103.8475))));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffe6f0fa),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image(
                                image:
                                    new AssetImage("images/location_icon.png"),
                              )),
                          Container(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "Find Drugstore",
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("show latest records");
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _latestRecord());
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffe6f0fa),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image(
                                image:
                                    new AssetImage("images/health-report.png"),
                                height: 40,
                                width: 40,
                              )),
                          Container(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "View Latest Record",
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditProfilePage()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffe6f0fa),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image(
                                image: new AssetImage(
                                    "images/editprofile_icon.png"),
                              )),
                          Container(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "Edit Profile",
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xffb5cbec),
                  thickness: 4,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FutureBuilder<List<Notif>>(
                  future: futureNotifs,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      userNotifs = snapshot.data;

                      _reminderList.clear();
                      _prescReqList.clear();
                      _diagnosisAppList.clear();

                      for (int i = 0; i < userNotifs.length; i++) {
                        if (userNotifs[i].type == "Reminders") {
                          _reminderList.add(userNotifs[i].content);
                        } else if (userNotifs[i].type == "Prescriptions") {
                          _prescReqList.add(userNotifs[i].content);
                        } else if (userNotifs[i].type == "Diagnoses") {
                          _diagnosisAppList.add(userNotifs[i].content);
                        }
                      }

                      if (userNotifs.length != 0) {
                        return Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(left: 20.0),
                            width: 370,
                            child: Column(
                              children: <Widget>[
                                _listView("Reminders", _reminderList,
                                    "reminder_icon"),
                                _diagnosisAppList.length != 0
                                    ? _listView("Diagnosis Approval",
                                        _diagnosisAppList, "approve_diag_icon")
                                    : Container(),
                                _prescReqList.length != 0
                                    ? _listView("Received Prescriptions",
                                        _prescReqList, "medicine_icon")
                                    : Container(),
                              ],
                            ));
                        }
                        else{
                          return Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 5.0, left: 20.0, bottom: 10.0),
                            width: 370,
                            child: Text("No notifications"),
                          );
                        }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
                  },
                ),
                Divider(
                  color: Color(0xffb5cbec),
                  thickness: 4,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Learn to be healthy!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    width: 370,
                    padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                    child: _listView("View your daily health tip", _healthTips,
                        "bulb_icon")),
              ],
            ),
          ),
        ));
  }

  Widget _listView(String title, List<String> info, String inclIconString) {
    List<String> _tip = [_healthTips[Random().nextInt(10)]];
    int boxColor = 0xfff2f6fc;
    bool expand = false;
    bool records = false;
    if (title == "View your daily health tip") {
      info = _tip;
    } else if (title == "Reminders" ||
        title == "Received Prescriptions" ||
        title == "Diagnosis Approval") {
      boxColor = 0xffffc3bd;
      expand = true;
      if (title != "Reminders") {
        records = true;
      }
    }

    return new ListView(
        padding: const EdgeInsets.only(right: 10.0),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          ExpandableGroup(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: new AssetImage("images/" + inclIconString + ".png"),
                  width: 30,
                  height: 30,
                ),
                Container(
                  child: Text("  "),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(boxColor),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            items: _buildItems(context, info, records),
            isExpanded: expand,
            expandedIcon: null,
            collapsedIcon: null,
          ),
        ]);
  }

  Widget _latestRecord() {
    List<List<dynamic>> latestDiagnosis = [
      [
        "Asthma",
        "29-03-2020",
        "Pablo",
        true,
        0.97,
        ["Dead"]
      ]
    ];
    List<List<dynamic>> latestPrescription = [
      [
        ["Paractemol", "Aspirin"],
        "30/02/2020",
        "Peter"
      ]
    ];

    String getDiagnosisName(int index) {
      for (int i = 0; i < userDiagnoses.length; i++) {
        if (userPrescriptions[index].diagnosis == userDiagnoses[i].id) {
          return userDiagnoses[i].condition;
        }
      }
      return "Diagnosis";
    }

    return new Dialog(
        backgroundColor: Colors.white,
        elevation: 10,
        child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 20.0, top: 5.0),
                      child: Text(
                        "Latest Record",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Last Diagnosis:  ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FutureBuilder<List<Diagnosis>>(
                      future: futureDiagnosis,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          userDiagnoses = snapshot.data;

                          return Container(
                              child: ListExpandableWidget(
                            isExpanded: false,
                            header: Row(
                              children: <Widget>[
                                userDiagnoses[0].approved
                                    ? Container(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Image(
                                            image: new AssetImage(
                                                "images/approve.png"),
                                            width: 30,
                                            height: 30))
                                    : Container(),
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xfff2f6fc),
                                  ),
                                  child: Text(
                                    userDiagnoses[0].date +
                                        ": " +
                                        userDiagnoses[0].condition,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                )),
                              ],
                            ),
                            items: _buildItems(
                                context, userDiagnoses[0].symptoms, false),
                          ));
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default, show a loading spinner.
                        return Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator());
                      },
                    ),
                    Divider(
                      color: Color(0xfff2f6fc),
                      thickness: 3,
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Text(
                          "Last Prescription:  ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    FutureBuilder<List<Prescription>>(
                      future: futurePrescription,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          userPrescriptions = snapshot.data;
                          return Container(
                              child: ListExpandableWidget(
                                  isExpanded: true,
                                  items: userPrescriptions[0].complete
                                      ? _buildItemsPrescription(
                                          context, userPrescriptions[0].drug)
                                      : _buildItems(
                                          context, ["Pending"], false),
                                  header: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      // height: 65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xfff2f6fc),
                                      ),
                                      child: Column(children: <Widget>[
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 5.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  userPrescriptions[0].date,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                userPrescriptions[0].complete
                                                    ? Text(
                                                        "Dr " +
                                                            userPrescriptions[0]
                                                                .doctor,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      )
                                                    : Text("-"),
                                              ]),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Text(
                                            getDiagnosisName(0),
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ]))));
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default, show a loading spinner.
                        return Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator());
                      },
                    )
                  ],
                ),
              ),
            )));
  }
}
