import 'package:flutter/material.dart';

class PrescriptionsPage extends StatefulWidget {
  @override
  _PrescriptionsPageState createState() => _PrescriptionsPageState();
}

class _PrescriptionsPageState extends State<PrescriptionsPage> {
  String _dropdownValue;
  List<String> _dropdownItems = ['One', 'Two', 'Free', 'Four'];
  String specialReq;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Image.asset('images/doctor_virtual_text.png', fit: BoxFit.cover),
        backgroundColor: Color(0xffe2eeff),
        leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 26.0,
                color: Colors.black,
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0),
            alignment: Alignment.topLeft,
            child: Text(
              "Request Prescription",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            alignment: Alignment.center,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: _dropdownValue == null
                    ? 'Choose a diagnosis to submit'
                    : 'Selected diagnosis',
              ),
              isEmpty: _dropdownValue == null,
              child: new DropdownButton<String>(
                value: _dropdownValue,
                isDense: true,
                isExpanded: true,
                icon: Icon(
                  Icons.arrow_downward,
                  color: Colors.black,
                ),
                iconSize: 24,
                onChanged: (String newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                  });
                },
                items: _dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Special Request: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 50,
                  width: 240,
                  child: TextFormField(
                    enabled: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter any special requests.",
                    ),
                    onChanged: (value) {
                      specialReq = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      )
    );
  }
}
