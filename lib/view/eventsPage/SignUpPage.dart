import 'package:drugstore_io/view/eventsPage/EditProfilePage.dart';
import 'package:drugstore_io/view/eventsPage/NewLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:drugstore_io/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:drugstore_io/controller/AccountManager.dart';
import 'package:drugstore_io/model/UserProfile.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showProgress = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String email, password, username;
  bool _acceptTerms = false;

  DatabaseReference fDbUsers =
      FirebaseDatabase.instance.reference().child('userInfo');

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(
      //  title: Text("Sign Up Page"),
      //),
      body: SingleChildScrollView(
          child: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/SignUpPage_Background.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Form(
                //key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: Container(
                            width: 350,
                            height: 280,
                            child: Image.asset('images/SignUpPage_Image.png')),
                      ),
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        onChanged: (value) {
                          username = value.trim();
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      height: 65,
                      child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'example@email.com'),
                          onChanged: (value) {
                            email = value.trim();
                          },
                          validator: (input) {
                            print("valide " + input);
                            return isValidEmail(input)
                                ? null
                                : "Please provide valid email";
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      height: 65,
                      child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: Image.asset(
                                  "images/signup_password_icon.png"),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter secure password'),
                          onChanged: (value) {
                            password = value;
                          }),
                    ),
                    CheckboxListTile(
                      value: _acceptTerms,
                      onChanged: (bool value) {
                        setState(() {
                          _acceptTerms = value;
                        });
                      },
                      title: const Text('I accept the terms and conditions',
                          style: TextStyle(
                              color: Color(0x7f000000), fontSize: 15)),
                    ),
                    /*Align(
                      alignment: Alignment.centerLeft,
                      child: FlatButton(
                        //padding: const EdgeInsets.only(left: 200.0),
                        onPressed: () {
                          print("Accepted terms and conditions");
                        },
                        child: Text(
                          'I accept the terms and conditions',
                          style:
                              TextStyle(color: Color(0x7f000000), fontSize: 15),
                        ),
                      ),
                    ),*/
                    Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      height: 50,
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            showProgress = true;
                          });
                          if (_acceptTerms) {
                            try {
                              final newuser =
                                  await auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              AccountManager.registerUser(newuser.user.uid,
                                  new UserProfile(email, username));
                              if (newuser != null) {
                                print("user created");
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()),
                                );
                                //Navigator.pop(context);
                              }

                              setState(() {
                                showProgress = false;
                              });
                            } catch (e) {
                              print(e.toString());
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff0f5d9a),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "SIGN UP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "or have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff6f6e6e),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      height: 50,
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Pressed Log In");
                          Navigator.push(
                                context, MaterialPageRoute(builder: (_) => NewLoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(color: Color(0xff6e6d6d), width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "LOG IN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
