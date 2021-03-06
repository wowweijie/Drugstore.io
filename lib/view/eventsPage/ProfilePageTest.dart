import 'package:drugstore_io/main.dart';
import 'package:drugstore_io/view/eventsPage/EditProfilePage.dart';
import 'package:expandable_group/expandable_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:drugstore_io/controller/AccountManager.dart';
import 'package:drugstore_io/model/UserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  bool enableNotifications = false;
  String name = "happy";
  String username = "pablo_123456";
  String password = "********";
  String gender = "Male";
  String birthday = "19 Aug 2000";
  String ethnicity = "European";
  String heightString = "169 cm";
  String weightString = "55 kg";
  String bloodType = "B+";
  List<String> allergies = ["Prawn", "Paracetamol"];
  List<String> existingMedCond = ["Anaemia", "Asthma"];
  List<String> personalMedHist = ["Pneumonia"];
  List<String> famMedHist = ["NIL"];

  List<ListTile> _buildItems(BuildContext context, List<String> items) => items
      .map((e) => ListTile(
            title: Text(e),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('images/doctor_virtual_text.png',
            fit: BoxFit.cover),
        backgroundColor: Color(0xffe2eeff),
        leading: Image(
            image: new AssetImage("images/doctor_virtual_icon.png")),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EditProfilePage()));
                },
                child: Icon(
                  Icons.edit,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  //Navigator.push(
                  //  context, MaterialPageRoute(builder: (_) => EditProfilePage()));
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
        ],
        actionsIconTheme:
            IconThemeData(color: Colors.blue, opacity: 10.0),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Container(
                      width: 250,
                      height: 220,
                      child: Image.asset('images/ProfilePage_Image.png')),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0),
                child: _userInfo("Name", name),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0),
                child: _userInfo("Username", username),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0),
                child: _userInfo("Password", password),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: _notificationSwitch(),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "About Me",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                    top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _aboutMeInfo("Gender", gender, ""),
                      _aboutMeInfo("Birthday", birthday, ""),
                      _aboutMeInfo("Ethnicity", ethnicity, ""),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                    top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _aboutMeInfo("Height", heightString, "cm"),
                      _aboutMeInfo("Weight", weightString, "kg"),
                      _aboutMeInfo("Blood Group", bloodType, ""),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Medical History",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListView(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 10.0, bottom: 50.0),
                shrinkWrap: true,
                children: <Widget>[
                  _medHistInfo("Allergies", allergies),
                  _medHistInfo(
                      "Existing Medical Conditions", existingMedCond),
                  _medHistInfo(
                      "Personal Medical History", personalMedHist),
                  _medHistInfo("Family Medical History", famMedHist),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInfo(String title, String info) {
    return new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xffeff5ff),
        ),
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            Text(
              info,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ],
        ));
  }

  Widget _notificationSwitch() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      //padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notifications",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          Switch(
            value: enableNotifications,
            onChanged: (value) {
              setState(() {
                enableNotifications = value;
                print(enableNotifications);
              });
            },
            activeTrackColor: Colors.blue.shade100,
            activeColor: Colors.lightBlue,
          ),
        ],
      ),
    );
  }

  Widget _aboutMeInfo(String title, String info, String suffix) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      width: 130,
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: title,
          suffixText: suffix,
        ),
        initialValue: info,
      ),
    );
  }

  Widget _medHistInfo(String title, List<String> info) {
    return new Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ExpandableGroup(
            header: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xfff2f6fc),
                ),
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                )),
            items: _buildItems(context, info),
            isExpanded: false,
          ),
        ],
      ),
    );
  }
}