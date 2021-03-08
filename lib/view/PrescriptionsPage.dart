import 'package:flutter/material.dart';
import 'package:expandable_group/expandable_group_widget.dart';
import 'package:list_expandable/list_expandable_widget.dart';

class PrescriptionsPage extends StatefulWidget {
  @override
  _PrescriptionsPageState createState() => _PrescriptionsPageState();
}

class _PrescriptionsPageState extends State<PrescriptionsPage> {
  String _dropdownValue;

  String specialReq;
  List<List<String>> _prescriptionInfo = [
    ["Paractemol", "Aspirin"],
    ["Insulin"],
    ["Telfast", "Vitamin C"]
  ];
  List<List<String>> _prescriptionDetails = [
    ["30/02/2020", "Peter"],
    ["16/06/2019", "Freud"],
    ["19/05/2019", "Louise"],
  ];
  List<String> _dropdownItems = ["30/02/2020", "16/06/2019", "19/05/2019"];

  List<ListTile> _buildItems(BuildContext context, List<String> items) => items
      .map((e) => ListTile(
            title: Text(e),
          ))
      .toList();

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
                  underline: Container(
                    color: Colors.transparent,
                  ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Special Request: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    //alignment: Alignment.centerRight,
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
            Container(
              padding: const EdgeInsets.only(top: 10.0, right: 20),
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  print("Submit prescription request");
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff0f5d9a),
                  side: BorderSide(color: Color(0xff6e6d6d), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
                  child: Text(
                    "Submit",
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
              height: 16,
              padding:
                  const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: Container(
                alignment: Alignment.center,
                color: Colors.blueGrey,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15.0, left: 20.0),
              alignment: Alignment.topLeft,
              child: Text(
                "View Prescription",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10.0, bottom: 50.0),
              shrinkWrap: true,
              children: _prescriptionInfo.map((group) {
                int index = _prescriptionInfo.indexOf(group);
                return ListExpandableWidget(
                  isExpanded: false,
                  header: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xfff2f6fc),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            _prescriptionDetails[index][0],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Dr " + _prescriptionDetails[index][1],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ]),
                  ),
                  items: _buildItems(context, group),
                );
              }).toList(),
            ),
          ]),
        ));
  }
}
