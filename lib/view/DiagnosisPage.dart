import 'package:flutter/material.dart';
import 'package:list_expandable/list_expandable_widget.dart';

class DiagnosisPage extends StatefulWidget {
  @override
  _DiagnosisPageState createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  List<List<String>> _diagnosisInfo = [
    ["Flu", "Cough"],
    ["Diabetes"],
    ["Headache", "Lack of nutrients"]
  ];

  List<String> _diagnosisDetails = ["30/02/2020", "16/06/2019", "19/05/2019"];

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
              padding: const EdgeInsets.only(top: 15.0, left: 20.0),
              alignment: Alignment.topLeft,
              child: Text(
                "View Diagnosis",
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
              children: _diagnosisInfo.map((group) {
                int index = _diagnosisInfo.indexOf(group);
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
                    child: Text(
                      _diagnosisDetails[index],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  items: _buildItems(context, group),
                );
              }).toList(),
            ),
          ]),
        ));
  }
}
