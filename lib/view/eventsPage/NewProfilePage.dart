import 'package:drugstore_io/main.dart';
import 'package:flutter/material.dart';

class NewProfilePage extends StatefulWidget {
  @override
  _NewProfilePageState createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  bool _enableNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('images/doctor_virtual_text.png', fit: BoxFit.cover),
        backgroundColor: Color(0xffe2eeff),
        leading: 
          Image(image :new AssetImage("images/doctor_virtual_icon.png")),
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
                child: Text("Pablo Stanley", 
                  style: TextStyle(color: Colors.black, fontSize: 25, 
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffeff5ff),
                    ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Name", 
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                      Text("Pablo Stanley",
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffeff5ff),
                    ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Username", 
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                      Text("pablo_123456",
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffeff5ff),
                    ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Password", 
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                      Text("********",
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    ),
                  //padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Notifications",
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                        textAlign: TextAlign.center,
                      ),
                      Switch(
                        value: _enableNotifications,
                        onChanged: (value) {
                          setState(() {
                            _enableNotifications = value;
                            print(_enableNotifications);
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
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffd3dae5),
                    ),
                  //height: 30,  
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                    "About Me",
                    style: TextStyle(color: Colors.black, fontSize: 17,),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
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
                          initialValue: "Male",
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
                          initialValue: "19 Aug 2000",
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
                          initialValue: "European",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
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
                          initialValue: "169 cm",
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
                          initialValue: "55 kg",
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
                          initialValue: "B+",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffd3dae5),
                    ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                    "Medical History",
                    style: TextStyle(color: Colors.black, fontSize: 17,),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xfff2f6fc),
                    ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Allergies", 
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                      Text(" ",
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xfff2f6fc),
                    ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Existing Medical Conditions", 
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                      Text(" ",
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xfff2f6fc),
                    ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Personal Medical History", 
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                      Text(" ",
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xfff2f6fc),
                    ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Family Medical History", 
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                      ),
                      Text(" ",
                        style: TextStyle(color: Colors.black, fontSize: 17,),
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