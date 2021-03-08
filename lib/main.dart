import 'package:drugstore_io/view/HomePage.dart';
import 'package:drugstore_io/view/PrescriptionsPage.dart';
import 'package:drugstore_io/view/RecordsPage.dart';
import 'package:drugstore_io/view/eventsPage/AppEntryPage.dart';
import 'package:drugstore_io/view/eventsPage/NewLoginPage.dart';
import 'package:drugstore_io/view/eventsPage/NewProfilePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:drugstore_io/view/reference/AboutPage.dart';
import 'package:drugstore_io/view/registration/LoginPage.dart';
import 'package:drugstore_io/view/eventsPage/SignUpPage.dart';
import 'package:drugstore_io/view/ChatPage.dart';
import 'package:drugstore_io/view/reference/StoriesPage.dart';
import 'package:drugstore_io/view/MainChatPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return FlutterEasyLoading(child: Text("Error"));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              debugShowCheckedModeBanner: false, home: AppEntryPage());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return FlutterEasyLoading(child: Text("Please wait.."));
      },
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    ChatPage(key: GlobalKey()),
    RecordsPage(),
    NewProfilePage(),
    //PrescriptionsPage(),
  ];

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Image(image: new AssetImage("images/home_icon.png")),
          ),
          BottomNavigationBarItem(
            label: "Doctor",
            icon: Image(image: new AssetImage("images/doctor_icon.png")),
          ),
          BottomNavigationBarItem(
            label: "Records",
            icon: Image(image: new AssetImage("images/records_icon.png")),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Image(image: new AssetImage("images/profile_icon.png")),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        backgroundColor: Color(0xffe2eeff),
      ),
    );
  }
}
