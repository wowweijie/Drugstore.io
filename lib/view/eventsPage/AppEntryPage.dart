import 'package:flutter/material.dart';

class AppEntryPage extends StatefulWidget {
  @override
  _AppEntryPageState createState() => _AppEntryPageState();
}

class _AppEntryPageState extends State<AppEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 411,
      height: 731,
      color: Colors.white,
      child: Stack(
          children:[
              Positioned(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: 630,
                      height: 300,
                      child: Image.asset('images/Vector.png')),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: 500,
                      height: 400,
                      child: Image.asset('images/Doctor.png')),
                ),
              ),
              Positioned(
                  left: 84,
                  top: 382,
                  child: Container(
                      width: 229,
                      height: 70,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset('images/Logo_EntryPage.png'))
                    ),
              ),
              Positioned(
                  left: 34,
                  top: 519,
                  child: Container(
                      width: 343,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                              Container(
                                  width: 343,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Color(0xff0f5d9a),
                                  ),
                                  padding: const EdgeInsets.only(left: 144, right: 143, ),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:[
                                          Text(
                                              "LOG IN",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(    color: Colors.white,
                                                  fontSize: 17,
                                              ),
                                          ),
                                      ],
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
              Positioned(
                  left: 34,
                  top: 596,
                  child: Container(
                      width: 343,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                              Container(
                                  width: 343,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Color(0xff0f5d9a),
                                  ),
                                  padding: const EdgeInsets.only(left: 138, right: 137, ),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:[
                                          Text(
                                              "SIGN UP",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(    color: Colors.white,
                                                  fontSize: 17,
                                              ),
                                          ),
                                      ],
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
              Positioned(
                  left: 46,
                  top: 468,
                  child: SizedBox(
                      width: 334,
                      height: 47,
                      child: Text(
                          "Your online Health Portal",
                          textAlign: TextAlign.center,
                          style: TextStyle(    color: Colors.black,
                              fontSize: 18,
                          ),
                      ),
                  ),
              ),
          ],
      ),
    );
  }
}