import 'package:drugstore_io/main.dart';
import 'package:flutter/material.dart';
import 'package:drugstore_io/view/registration/LoginPage.dart';
import 'package:drugstore_io/view/eventsPage/NewLoginPage.dart';

class AppEntryPage extends StatefulWidget {
  @override
  _AppEntryPageState createState() => _AppEntryPageState();
}

class _AppEntryPageState extends State<AppEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(
      //  title: Text("Doctor Virtual"),
      //),
      body: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/AppEntryPage_Background.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                    width: 500,
                    height: 350,
                    child: Image.asset('images/Doctor.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                    padding: const EdgeInsets.only(left: 70.0, right: 70.0, bottom: 10.0),
                    child: Image.asset('images/drugstore.io_logo.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: 
                      Text("Your Online Health Portal", textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 18,),
                      ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    print("Pressed Log in");
                    Navigator.push(
                          context, MaterialPageRoute(builder: (_) => NewLoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff0f5d9a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Center(
                    child: 
                      Text("LOG IN", textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 17,),
                      ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    print("Pressed Sign up");
                    //Navigator.push(
                    //      context, MaterialPageRoute(builder: (_) => SignUpPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff0f5d9a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Center(
                    child: 
                      Text("SIGN UP", textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 17,),
                      ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
