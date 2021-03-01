import 'package:drugstore_io/main.dart';
import 'package:drugstore_io/view/eventsPage/EditProfilePage.dart';
import 'package:expandable_group/expandable_group_widget.dart';
import 'package:flutter/material.dart';

class NewProfilePage extends StatefulWidget {
  @override
  _NewProfilePageState createState() => _NewProfilePageState();
}


class _NewProfilePageState extends State<NewProfilePage> {
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
        title: Image.asset('images/doctor_virtual_text.png', fit: BoxFit.cover),
        backgroundColor: Color(0xffe2eeff),
        leading: Image(image: new AssetImage("images/doctor_virtual_icon.png")),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => EditProfilePage()));
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
                      Text(
                        name,
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
                      Text(
                        username,
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
                      Text(
                        password,
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
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Gender",
                          ),
                          initialValue: gender,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Birthday",
                          ),
                          initialValue: birthday,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Ethnicity",
                            ),
                            initialValue: ethnicity),
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
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Height",
                          ),
                          initialValue: heightString,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Weight",
                          ),
                          initialValue: weightString,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 60,
                        width: 130,
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Blood Group",
                          ),
                          initialValue: bloodType,
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
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ExpandableGroup(
                          header: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xfff2f6fc),
                              ),
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                            child: Text("Allergies", 
                              style: TextStyle(color: Colors.black, fontSize: 17,),
                            )
                          ),
                          items: _buildItems(context, allergies),
                          isExpanded: false,
                        ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ExpandableGroup(
                      header: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff2f6fc),
                          ),
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                        child: Text("Existing Medical Conditions", 
                          style: TextStyle(color: Colors.black, fontSize: 17,),
                        )
                      ),
                      items: _buildItems(context, existingMedCond),
                      isExpanded: false,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ExpandableGroup(
                          header: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xfff2f6fc),
                              ),
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                            child: Text("Personal Medical History", 
                              style: TextStyle(color: Colors.black, fontSize: 17,),
                            )
                          ),
                          items: _buildItems(context, personalMedHist),
                          isExpanded: false,
                        ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ExpandableGroup(
                          header: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xfff2f6fc),
                              ),
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                            child: Text("Family Medical History", 
                              style: TextStyle(color: Colors.black, fontSize: 17,),
                            )
                          ),
                          items: _buildItems(context, famMedHist),
                          isExpanded: false,
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
