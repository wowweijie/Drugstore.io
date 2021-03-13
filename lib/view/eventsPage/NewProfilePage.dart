// import 'dart:html';

import 'package:drugstore_io/main.dart';
import 'package:drugstore_io/view/eventsPage/AppEntryPage.dart';
import 'package:drugstore_io/view/eventsPage/EditProfilePage.dart';
import 'package:drugstore_io/view/eventsPage/NewLoginPage.dart';
import 'package:expandable_group/expandable_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:drugstore_io/controller/AccountManager.dart';
import 'package:drugstore_io/model/UserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewProfilePage extends StatefulWidget {
  @override
  _NewProfilePageState createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserProfile> futureProfile;

  @override
  void initState() {
    super.initState();
    futureProfile = fetchProfile(auth.currentUser.uid.toString());
  }

  bool enableNotifications = false;
  String name = "Pablo Stanley";
  String username = "pablo_123456";
  String password = "********";
  String gender = "Male";
  String birthday = "19 Aug 2000";
  String ethnicity = "European";
  String height = "169 cm";
  String weight = "55 kg";
  String bloodType = "B+";
  List<dynamic> allergies = ["Prawn", "Paracetamol"];
  List<dynamic> existingMedCond = ["Anaemia", "Asthma"];
  List<dynamic> personalMedHist = ["Pneumonia"];
  List<dynamic> famMedHist = ["NIL"];

  List<ListTile> _buildItems(BuildContext context, List<dynamic> items) => items
      .map((e) => ListTile(
            title: Text(e),
          ))
      .toList();

  _navigateNextPageAndRetriveValue(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditProfilePage()),
    );

    setState(() {
      futureProfile = fetchProfile(auth.currentUser.uid.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Image(
            image: new AssetImage("images/drugstore.io_text.png"),
            fit: BoxFit.fitHeight,
            height: 35,
          ),
          backgroundColor: Color(0xffe2eeff),
          leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: ClipOval(
              child: Image(
                image: new AssetImage("images/drugstore.io_icon.png"),
              ),
            ),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => EditProfilePage()));
                    _navigateNextPageAndRetriveValue(context);
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AppEntryPage()));
                  },
                  child: Icon(
                    Icons.logout,
                    size: 26.0,
                  ),
                )),
          ],
          actionsIconTheme: IconThemeData(color: Colors.blue, opacity: 10.0),
        ),
        body: FutureBuilder<UserProfile>(
          future: futureProfile,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              username = snapshot.data.username;
              name = snapshot.data.name;
              gender = snapshot.data.gender;
              birthday = snapshot.data.birthday;
              ethnicity = snapshot.data.ethnicity;
              height = snapshot.data.height;
              weight = snapshot.data.weight;
              bloodType = snapshot.data.bloodType;
              allergies = snapshot.data.allergies;
              existingMedCond = snapshot.data.existingMedCond;
              personalMedHist = snapshot.data.personalMedHist;
              famMedHist = snapshot.data.famMedHist;
              print(height);
              print(username);
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: Container(
                              width: 250,
                              height: 220,
                              child:
                                  Image.asset('images/ProfilePage_Image.png')),
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
                              _aboutMeInfo("Height", height, "cm"),
                              _aboutMeInfo("Weight", weight, "kg"),
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
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          },
        ));
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

  Widget _medHistInfo(String title, List<dynamic> info) {
    return new Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
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
