import 'dart:math';

import 'package:list_expandable/list_expandable_widget.dart';
import 'package:drugstore_io/view/eventsPage/EditProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:expandable_group/expandable_group_widget.dart';
import 'package:drugstore_io/model/Diagnosis.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _latestPrescription = ["Paracetamol 75mg", "Antacid 50mg"];
  List<String> _reminderList = [
    "Take Paracetamol at 12:30 after food",
    "Take insulin injection after your meal"
  ];
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
  List<String> _diagnosisAppList = [
    "2021-03-08: Asthma exacerbation - Approved"
  ];
  List<String> _prescReqList = [
    "Received a prescription for 2021-03-08: Asthma exacerbation"
  ];

  List<ListTile> _buildItems(BuildContext context, List<String> items) => items
      .map((e) => ListTile(
            title: Text(e),
          ))
      .toList();

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
                                // Navigator.push(
                                //   context, MaterialPageRoute(builder: (_) => MyBottomNavigationBar()));
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
                              "Find Hospital",
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
                Container(
                  alignment: Alignment.topLeft,
                  width: 370,
                  child: Column(
                    children: <Widget>[
                      _listView("Reminders", _reminderList, "reminder_icon"),
                      _diagnosisAppList.length != 0
                          ? _listView("Diagnosis Approval", _diagnosisAppList,
                              "approve_diag_icon")
                          : Container(),
                      _prescReqList.length != 0
                          ? _listView("Received Prescriptions", _prescReqList,
                              "medicine_icon")
                          : Container(),
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
                    child: _listView("View your daily health tip", _healthTips,
                        "bulb_icon")),
                /*Divider(
                  color: Color(0xffb5cbec),
                  thickness: 4,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  alignment: Alignment.topLeft,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Last Diagnosis:  ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Diabetes Type 1",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //padding: const EdgeInsets.only(bottom: 50.0),
                  width: 370,
                  child: _listView("View Prescription", _latestPrescription,
                      "symptoms_icon"),
                ),*/
              ],
            ),
          ),
        ));
  }

  Widget _listView(String title, List<String> info, String inclIconString) {
    List<String> _tip = [_healthTips[Random().nextInt(10)]];
    int boxColor = 0xfff2f6fc;
    bool expand = false;
    if (title == "View your daily health tip") {
      info = _tip;
    } else if (title == "Reminders" ||
        title == "Received Prescriptions" ||
        title == "Diagnosis Approval") {
      boxColor = 0xffffc3bd;
      expand = true;
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
            items: _buildItems(context, info),
            isExpanded: expand,
          ),
        ]);
  }

  /*Widget _latestRecord() {
    List<Diagnosis> latestDiagnosis = [Diagnosis("Asthma", "29-03-2020", "Pablo", true, 0.97, ["Dead"])];
    return new Dialog(
      backgroundColor: Colors.white,
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Last Diagnosis:  ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10.0, bottom: 50.0),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: latestDiagnosis.map((group) {
                int index = latestDiagnosis.indexOf(group);
                return ListExpandableWidget(
                  isExpanded: false,
                  header: Row(
                    children: <Widget>[
                      latestDiagnosis[index].approved
                          ? Image(
                              image: new AssetImage("images/approve_icon.png"),
                              width: 30,
                              height: 30)
                          : Container(),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff2f6fc),
                        ),
                        child: Text(
                          latestDiagnosis[index].date +
                              ": " +
                              latestDiagnosis[index].condition,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )),
                    ],
                  ),
                  items: _buildItems(context, group.symptoms),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }*/
}
