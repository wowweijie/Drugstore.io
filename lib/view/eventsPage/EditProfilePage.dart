import 'package:drugstore_io/controller/AccountManager.dart';
import 'package:drugstore_io/main.dart';
import 'package:drugstore_io/view/eventsPage/NewProfilePage.dart';
import 'package:drugstore_io/view/reference/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:drugstore_io/model/UserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class MedHealthDetails {
  final String itemDetail;

  const MedHealthDetails(this.itemDetail);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedHealthDetails &&
          runtimeType == other.runtimeType &&
          itemDetail == other.itemDetail;

  @override
  int get hashCode => itemDetail.hashCode;

  @override
  String toString() {
    return itemDetail;
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
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
  String height = "169";
  String weight = "55";
  String bloodType = "B+";
  List<dynamic> allergies = ["Prawn", "Paracetamol"];
  List<dynamic> existingMedCond = ["Anaemia", "Asthma"];
  List<dynamic> personalMedHist = ["Pneumonia"];
  List<dynamic> famMedHist = ["NIL"];

  List<String> _gender = ['Male', 'Female', 'Others'];

  @override
  Widget build(BuildContext context) {
    const commonAllergies = <MedHealthDetails>[
      MedHealthDetails("Eggs"),
      MedHealthDetails("Soy"),
      MedHealthDetails("Milk"),
      MedHealthDetails("Peanuts"),
      MedHealthDetails("Wheat"),
      MedHealthDetails("Paracetamol"),
      MedHealthDetails("Prawn"),
      MedHealthDetails("NIL"),
    ];

    const commonMedCond = <MedHealthDetails>[
      MedHealthDetails("Hypertension"),
      MedHealthDetails("Hyperlipidemia"),
      MedHealthDetails("Diabetes"),
      MedHealthDetails("Back pain"),
      MedHealthDetails("Anxiety"),
      MedHealthDetails("Obesity"),
      MedHealthDetails("NIL"),
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:
              Image.asset('images/doctor_virtual_text.png', fit: BoxFit.cover),
          backgroundColor: Color(0xffe2eeff),
          leading:
              Image(image: new AssetImage("images/doctor_virtual_icon.png")),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    final status = await updateProfile(
                        auth.currentUser.uid.toString(),
                        name,
                        username,
                        gender,
                        birthday,
                        height,
                        weight,
                        bloodType,
                        ethnicity,
                        allergies,
                        existingMedCond,
                        famMedHist,
                        personalMedHist);

                    if (status.runtimeType == http.Response) {
                      print("user updated");
                      Future.delayed(Duration(milliseconds: 500), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyBottomNavigationBar()));
                      });
                    }
                  },
                  child: Icon(
                    Icons.save,
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
                          "Edit Your Profile",
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
                        child: _userInfoTextField("Name", name),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0),
                        child: _userInfoTextField("Username", username),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0),
                        child: _userInfoTextField("Password", password),
                      ),
                      _notificationSwitch(),
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
                              DropDownMenu(dropdownValue: gender),
                              _aboutMeInfoTextField("Birthday", birthday, ""),
                              _aboutMeInfoTextField("Ethnicity", ethnicity, ""),
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
                              _aboutMeInfoTextField("Height", height, "cm"),
                              _aboutMeInfoTextField("Weight", weight, "kg"),
                              _aboutMeInfoTextField(
                                  "Blood Group", bloodType, ""),
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
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0),
                        child: _medHistTitle("Allergies"),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: _medHistInfoChipsInput(
                            "allergies", allergies, commonAllergies),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 20.0, right: 20.0),
                          child: _medHistTitle("Existing Medical Conditions")),
                      Container(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: _medHistInfoChipsInput(
                            "existing medical conditions",
                            existingMedCond,
                            commonMedCond),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0),
                        child: _medHistTitle("Personal Medical History"),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: _medHistInfoChipsInput(
                            "personal medical history",
                            personalMedHist,
                            commonMedCond),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0),
                        child: _medHistTitle("Family Medical History"),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, bottom: 60.0),
                          child: _medHistInfoChipsInput(
                              "family medical history",
                              famMedHist,
                              commonMedCond)),
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

  Widget _userInfoTextField(String title, String initValue) {
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
          Container(
            width: 150,
            height: 25,
            padding: const EdgeInsets.only(top: 10.0),
            child: TextFormField(
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter ' + title),
              initialValue: initValue,
              onChanged: (value) {
                initValue = value;
                if (title == "Name") {
                  name = value;
                } else if (title == "Username") {
                  username = value;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _notificationSwitch() {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Container(
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
      ),
    );
  }

  Widget _aboutMeInfoTextField(String title, String info, String suffix) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      width: 130,
      child: TextFormField(
        enabled: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: title,
          suffixText: suffix,
        ),
        initialValue: info,
        onChanged: (value) {
          info = value;
          if (title == "Gender") {
            gender = value;
          } else if (title == "Birthday") {
            birthday = value;
          } else if (title == "Ethnicity") {
            ethnicity = value;
          } else if (title == "Height") {
            height = value;
          } else if (title == "Weight") {
            weight = value;
          } else if (title == "Blood Group") {
            bloodType = value;
          }
        },
      ),
    );
  }

  Widget _aboutMeInfoDropdown(String title, String info) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      width: 130,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(),
        ),
        isEmpty: info == null,
        child: new DropdownButton<String>(
          underline: Container(color: Colors.transparent),
          value: info,
          isDense: true,
          isExpanded: true,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          iconSize: 24,
          onChanged: (String value) {
            setState(() {
              info = value;
              gender = value;
            });
            print(info);
            print(gender);
          },
          items: _gender.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _medHistTitle(String title) {
    return new Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xfff2f6fc),
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
            " ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget _medHistInfoChipsInput(
      String title, List<dynamic> userInfo, List<MedHealthDetails> commonInfo) {
    return new ChipsInput(
      initialValue: userInfo.map((item) => MedHealthDetails(item)).toList(),
      decoration: InputDecoration(
        labelText: "Input " + title,
      ),
      findSuggestions: (String query) {
        if (query.length != 0) {
          return findChipsSuggestions(query, commonInfo);
        } else {
          return const <MedHealthDetails>[];
        }
      },
      onChanged: (data) {
        userInfo = data.map((item) => item.toString()).toList();
        print(userInfo);
      },
      chipBuilder: (context, state, item) {
        return InputChip(
          key: ObjectKey(item),
          label: Text(item.itemDetail),
          onDeleted: () => state.deleteChip(item),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
      suggestionBuilder: (context, state, item) {
        return ListTile(
          key: ObjectKey(item),
          title: Text(item.itemDetail),
          onTap: () => state.selectSuggestion(item),
        );
      },
    );
  }

  List<MedHealthDetails> findChipsSuggestions(
      String query, List<MedHealthDetails> medList) {
    var lowercaseQuery = query.toLowerCase();
    return medList.where((item) {
      return item.itemDetail.toLowerCase().contains(query.toLowerCase());
    }).toList(growable: false)
      ..sort((a, b) => a.itemDetail
          .toLowerCase()
          .indexOf(lowercaseQuery)
          .compareTo(b.itemDetail.toLowerCase().indexOf(lowercaseQuery)));
  }
}

class DropDownMenu extends StatefulWidget {
  final String dropdownValue;
  DropDownMenu({Key key, @required this.dropdownValue}) : super(key: key);
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String _dropdownValue;
  List<String> _gender = ['Male', 'Female', 'Others'];
  @override
  Widget build(BuildContext context) {
    _dropdownValue = widget.dropdownValue;
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      width: 130,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(),
        ),
        isEmpty: _dropdownValue == null,
        child: new DropdownButton<String>(
          underline: Container(color: Colors.transparent),
          value: _dropdownValue,
          isDense: true,
          isExpanded: true,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          iconSize: 24,
          onChanged: (String value) {
            setState(() {
              _dropdownValue = value;
            });
          },
          items: _gender.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
