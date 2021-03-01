import 'package:drugstore_io/main.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
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
                onTap: () {},
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
                        "Allergies",
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
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
