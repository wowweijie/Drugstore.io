import 'package:drugstore_io/view/eventsPage/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:drugstore_io/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:drugstore_io/globals.dart' show authInstance;

class NewLoginPage extends StatefulWidget {
  @override
  _NewLoginPageState createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  final _formKey = GlobalKey<FormState>();
  var email, password;

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
      //  title: Text("New Login Page"),
      //),
      body: SingleChildScrollView(
          child: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/LoginPage_Background.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Container(
                            width: 500,
                            height: 350,
                            child: Image.asset('images/LoginPageImage.png')),
                      ),
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Image.asset("images/email_icon.png"),
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
                              prefixIcon:
                                  Image.asset("images/password_icon.png"),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter secure password'),
                          onChanged: (value) {
                            password = value;
                          }),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        //padding: const EdgeInsets.only(left: 200.0),
                        onPressed: () {
                          print("Pressed Forgot Password");
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      height: 50,
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            try {
                              print("email: " + email);
                              print("password: " + password);
                              await authInstance.signInWithEmailAndPassword(
                                  email: email, password: password);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                            print("Login Success...");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MyBottomNavigationBar(
                                        key: GlobalKey(), selectedIndex: 0)));
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
                            "LOG IN",
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
                        "or",
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
                          print("Pressed Sign up");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignUpPage()));
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
                            "SIGN UP",
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
