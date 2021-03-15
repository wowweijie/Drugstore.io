import 'package:flutter/material.dart';

class DiagnosisResult extends StatelessWidget {
  DiagnosisResult({this.condition, this.chance, this.name});

  final String condition;
  final String chance;
  final String name;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: new CircleAvatar(
          child: Image(
            image: new AssetImage("images/chat_doctor_icon.png"),
            fit: BoxFit.fitHeight,
            alignment: Alignment.center,
          ),
          radius: 30.0,
          backgroundColor: Colors.transparent,
        ),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style:
                    new TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: _buildMessageBubble(condition, chance)),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: otherMessage(context),
      ),
    );
  }
}

Widget _buildMessageBubble(condition, chance) {
  return new Material(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        topLeft: Radius.circular(0),
        bottomRight: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      color: Colors.lightGreen[50],
      elevation: 5,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Based on the symptoms that you are currently experiencing, " +
                      "I believe you are suffering from ...",
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  condition,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Probability : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: chance + "%")
                      ]),
                ),
                SizedBox(height: 30),
                ApprovalButton()
              ])));
}

class ApprovalButton extends StatefulWidget {
  @override
  _ApprovalButtonState createState() => _ApprovalButtonState();
}

class _ApprovalButtonState extends State<ApprovalButton> {
  bool pressGeoON = false;
  int displayState = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      Text("Request for doctor's approval"),
      Text("Awaiting for approval"),
      Text("Approved for prescription"),
    ];
    List<Color> buttonShade = [Colors.white, Colors.grey[300], Colors.white];
    List<Color> textColor = [Colors.black, Colors.white, Colors.black];
    return SizedBox(
        width: double.infinity,
        child: RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(
                    color: displayState == 2 ? Colors.green : Colors.black)),
            color: buttonShade[displayState],
            textColor: textColor[displayState],
            child: widgetList[displayState],
            //    style: TextStyle(fontSize: 14)
            onPressed: () {
              setState(() {
                pressGeoON = !pressGeoON;
                displayState = (displayState + 1) % 3;
              });
            }));
  }
}
