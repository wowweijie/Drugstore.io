import 'package:drugstore_io/view/PrescriptionsPage.dart';
import 'package:flutter/material.dart';

class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:
              Image.asset('images/doctor_virtual_text.png', fit: BoxFit.cover),
          backgroundColor: Color(0xffe2eeff),
          leading:
              Image(image: new AssetImage("images/doctor_virtual_icon.png")),
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: <Widget>[
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
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Go to diagnosis page");
                      //Navigator.push(
                      //      context, MaterialPageRoute(builder: (_) => SignUpPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(color: Color(0xff6e6d6d), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      minimumSize: Size(150,100),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Image(
                          height: 50,
                          width: 50,
                          image: new AssetImage("images/duration_icon.png"),
                        ),
                        Text(
                          "Diagnosis",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ]
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Go to prescriptions page");
                      Navigator.push(
                            context, MaterialPageRoute(builder: (_) => PrescriptionsPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(color: Color(0xff6e6d6d), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      minimumSize: Size(150,100),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Image(
                          height: 50,
                          width: 50,
                          image: new AssetImage("images/date_icon.png"),
                        ),
                        Text(
                          "Presciptions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]))));
  }
}
