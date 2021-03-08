import 'package:drugstore_io/view/RecordsPage.dart';
import 'package:drugstore_io/view/eventsPage/AppEntryPage.dart';
import 'package:drugstore_io/view/eventsPage/NewProfilePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:drugstore_io/view/reference/AboutPage.dart';
import 'package:drugstore_io/view/eventsPage/NewLoginPage.dart';
import 'package:drugstore_io/view/eventsPage/SignUpPage.dart';
import 'package:drugstore_io/view/reference/HomePage.dart';
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
              debugShowCheckedModeBanner: false, home: NewLoginPage());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return FlutterEasyLoading(child: Text("Please wait.."));
      },
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  @override
  MyBottomNavigationBar({Key key, @required this.selectedIndex})
      : super(key: key);
  createState() => _MyBottomNavigationBarState(selectedIndex);
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  _MyBottomNavigationBarState(this._selectedIndex);
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    //AppEntryPage(),
    HomePage(),
    ChatPage(key: GlobalKey()),
    RecordsPage(),
    NewProfilePage(),
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
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Chat",
            icon: Icon(
              Icons.chat,
            ),
          ),
          BottomNavigationBarItem(
            label: "Stories",
            icon: Icon(
              Icons.question_answer,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
