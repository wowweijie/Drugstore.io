import 'dart:io';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

class PrescriptionPDF extends StatefulWidget {
  @override
  _PrescriptionPDFState createState() => new _PrescriptionPDFState();
}

class _PrescriptionPDFState extends State<PrescriptionPDF> {
  Future<String> futurePathPDF;
  String pathPDF;

  @override
  void initState() {
    super.initState();
    futurePathPDF = createFileOfPdfUrl();
  }

  Future<String> createFileOfPdfUrl() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File tempFile = File('$tempPath/copy.pdf');
    ByteData bd = await rootBundle.load('images/prescription.pdf');
    await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: false);
    return tempFile.path;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: futurePathPDF,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          pathPDF = snapshot.data;
          return PDFViewerScaffold(
              appBar: AppBar(
                title:Image(
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
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
              path: pathPDF);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return Align(
            alignment: Alignment.center, child: CircularProgressIndicator());
      },
    );
  }
}