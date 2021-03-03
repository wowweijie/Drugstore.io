import 'package:drugstore_io/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

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
  bool enableNotifications = false;
  String name = "Pablo Stanley";
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
    ];

    const commonMedCond = <MedHealthDetails>[
      MedHealthDetails("Hypertension"),
      MedHealthDetails("Hyperlipidemia"),
      MedHealthDetails("Diabetes"),
      MedHealthDetails("Back pain"),
      MedHealthDetails("Anxiety"),
      MedHealthDetails("Obesity"),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('images/doctor_virtual_text.png', fit: BoxFit.cover),
        backgroundColor: Color(0xffe2eeff),
        leading: Image(image: new AssetImage("images/doctor_virtual_icon.png")),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.save,
                  size: 26.0,
                ),
              )),
        ],
        actionsIconTheme: IconThemeData(color: Colors.blue, opacity: 10.0),
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
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
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
                        "Name",
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
                              border: InputBorder.none,
                              hintText: 'Enter a name'),
                          initialValue: name,
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
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
                        "Username",
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
                              border: InputBorder.none,
                              hintText: 'Enter a username'),
                          initialValue: username,
                          onChanged: (value) {
                            username = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
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
                        "Password",
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
                              border: InputBorder.none,
                              hintText: 'Enter a new password'),
                          initialValue: password,
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
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
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Gender",
                          ),
                          initialValue: gender,
                          onChanged: (value) {
                            gender = value;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Birthday",
                          ),
                          initialValue: birthday,
                          onChanged: (value) {
                            birthday = value;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Ethnicity",
                          ),
                          initialValue: ethnicity,
                          onChanged: (value) {
                            ethnicity = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Height",
                            suffixText: "cm",
                          ),
                          initialValue: heightString,
                          onChanged: (value) {
                            heightString = value;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Weight",
                            suffixText: "kg",
                          ),
                          initialValue: weightString,
                          onChanged: (value) {
                            weightString = value;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Blood Group",
                          ),
                          initialValue: bloodType,
                          onChanged: (value) {
                            bloodType = value;
                          },
                        ),
                      ),
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
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Container(
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
                        "Allergies  ",
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
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: ChipsInput(
                  initialValue:
                      allergies.map((item) => MedHealthDetails(item)).toList(),
                  decoration: InputDecoration(
                    labelText: "Input allergies",
                  ),
                  //maxChips: 3,
                  findSuggestions: (String query) {
                    if (query.length != 0) {
                      return findChipsSuggestions(query, commonAllergies);
                    } else {
                      return const <MedHealthDetails>[];
                    }
                  },
                  onChanged: (data) {
                    allergies = data.map((item) => item.toString()).toList();
                    print(allergies);
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
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
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
                        "Existing Medical Conditions",
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
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: ChipsInput(
                  initialValue: existingMedCond
                      .map((item) => MedHealthDetails(item))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: "Input existing medical conditions",
                  ),
                  //maxChips: 3,
                  findSuggestions: (String query) {
                    if (query.length != 0) {
                      return findChipsSuggestions(query, commonMedCond);
                    } else {
                      return const <MedHealthDetails>[];
                    }
                  },
                  onChanged: (data) {
                    existingMedCond =
                        data.map((item) => item.toString()).toList();
                    print(existingMedCond);
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
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
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
                        "Personal Medical History",
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
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: ChipsInput(
                  initialValue: personalMedHist
                      .map((item) => MedHealthDetails(item))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: "Input personal medical history",
                  ),
                  //maxChips: 3,
                  findSuggestions: (String query) {
                    if (query.length != 0) {
                      return findChipsSuggestions(query, commonMedCond);
                    } else {
                      return const <MedHealthDetails>[];
                    }
                  },
                  onChanged: (data) {
                    personalMedHist =
                        data.map((item) => item.toString()).toList();
                    print(personalMedHist);
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
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
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
                        "Family Medical History",
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
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: ChipsInput(
                  initialValue:
                      famMedHist.map((item) => MedHealthDetails(item)).toList(),
                  decoration: InputDecoration(
                    labelText: "Input family medical history",
                  ),
                  //maxChips: 3,
                  findSuggestions: (String query) {
                    if (query.length != 0) {
                      return findChipsSuggestions(query, commonMedCond);
                    } else {
                      return const <MedHealthDetails>[];
                    }
                  },
                  onChanged: (data) {
                    famMedHist = data.map((item) => item.toString()).toList();
                    print(famMedHist);
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
                ),
              ),
              /*Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter your allergies'),
                  initialValue: famMedHist.first,
                  onChanged: (value) {
                    famMedHist.add(value);
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
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
