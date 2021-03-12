import 'package:flutter/material.dart';
import 'package:list_expandable/list_expandable_widget.dart';
import 'package:drugstore_io/controller/DiagnosisManager.dart';
import 'package:drugstore_io/model/Diagnosis.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CombinedRecordsPage extends StatefulWidget {
  @override
  _CombinedRecordsPageState createState() => _CombinedRecordsPageState();
}

class _CombinedRecordsPageState extends State<CombinedRecordsPage> {

  final _formKey = GlobalKey<FormState>();
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<Diagnosis>> futureDiagnosis;
  List<Diagnosis> userDiagnoses;

  @override
  void initState() {
    super.initState();
    futureDiagnosis = fetchDiagnosis(auth.currentUser.uid.toString());
  }

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

  String selectedDiagnosis;
  setDiagnosis(String diagnosis) {
    this.selectedDiagnosis = diagnosis;
    print(selectedDiagnosis);
  }

  List<ListTile> _buildItems(BuildContext context, List<dynamic> items) => items
      .map((e) => ListTile(
            title: Text(e),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Image(
            image: new AssetImage("images/drugstore.io_text.png"), 
            fit: BoxFit.fitHeight,
            height: 35,
          ),
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
        body: FutureBuilder<List<Diagnosis>>(
          future: futureDiagnosis,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              userDiagnoses = snapshot.data;

              return SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 15.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Diagnosis",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 10.0, right: 10.0, bottom: 50.0),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: userDiagnoses.map((group) {
                      int index = userDiagnoses.indexOf(group);
                      return ListExpandableWidget(
                        isExpanded: false,
                        header: Row(
                          children: <Widget>[
                            userDiagnoses[index].approved
                                ? Image(
                                    image: new AssetImage(
                                        "images/approve_icon.png"),
                                    width: 30,
                                    height: 30)
                                : Container(),
                            Expanded(
                                child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xfff2f6fc),
                              ),
                              child: Text(
                                userDiagnoses[index].date +
                                    ": " +
                                    userDiagnoses[index].condition,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )),
                          ],
                        ),
                        items: _buildItems(context, group.symptoms),
                      );
                    }).toList(),
                  ),
                  Divider(
                    height: 4,
                    indent: 20.0,
                    endIndent: 20.0,
                    color: Colors.blueGrey,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Prescriptions",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _requestPrescriptionDialog());
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
                          "Request prescription",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
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
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
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
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          },
        ));
  }

  Widget _requestPrescriptionDialog(){
    return new Dialog(
      backgroundColor: Colors.white,
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close, color: Colors.black, size: 15.0),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Request Prescription",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Attach diagnosis",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 20.0, right: 20.0),
                      alignment: Alignment.center,
                      child: DropDownMenu(
                          dropdownItems: userDiagnoses, callback: setDiagnosis),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 5.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Special Requests (if any): ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      height: 150,
                      width: 275,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        //expands: true,
                        enabled: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter any special requests.",
                          contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                        ),
                        onChanged: (value) {
                          specialReq = value;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, right: 20),
                      alignment: Alignment.center,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef void StringCallback(String val);

class DropDownMenu extends StatefulWidget {
  final List<Diagnosis> dropdownItems;
  final StringCallback callback;
  DropDownMenu({Key key, @required this.dropdownItems, this.callback})
      : super(key: key);
  @override
  _DropDownMenuState createState() =>
      _DropDownMenuState(dropdownItems, callback);
}

class _DropDownMenuState extends State<DropDownMenu> {
  _DropDownMenuState(this.dropdownItems, this.callback);
  String dropdownValue;
  StringCallback callback;
  final List<Diagnosis> dropdownItems;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: dropdownValue == null
              ? 'Choose a diagnosis to submit'
              : 'Selected diagnosis',
          border: OutlineInputBorder(),
        ),
        isEmpty: dropdownValue == null,
        child: new DropdownButton<String>(
          underline: Container(color: Colors.transparent),
          value: dropdownValue,
          isDense: true,
          isExpanded: true,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          iconSize: 24,
          onChanged: (String value) {
            setState(() {
              dropdownValue = value;
              callback(value);
            });
          },
          items: dropdownItems.map((value) {
            return DropdownMenuItem<String>(
              value: value.date + ": " + value.condition,
              child: Text(value.date + ": " + value.condition),
            );
          }).toList(),
        ),
      ),
    );
  }
}