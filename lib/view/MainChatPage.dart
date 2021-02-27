import 'package:flutter/material.dart';

class MainChatPage extends StatefulWidget {
  @override
  _MainChatPageState createState() => _MainChatPageState();
}

class _MainChatPageState extends State<MainChatPage> {
  final List<ChatMessage> _messages = <ChatMessage>[
    new ChatMessage(
      text:
          "Hi there! This is a reminder that you have an event coming up in 3 days! The event you have successfully registered for is: #I Am Remarkable workshop for YOUth. Could you please confirm that you are attending the event? (Yes/No)",
      name: "Blossom",
      type: false,
    )
  ];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Chat with Blossom',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
            width: 411,
            height: 731,
            color: Colors.white,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                    Container(
                        width: 411,
                        height: 64,
                        color: Color(0xffe2eeff),
                        padding: const EdgeInsets.only(left: 17, right: 238, top: 8, bottom: 7, ),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                                Container(
                                    width: 156,
                                    height: 48.72,
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:[
                                            Container(
                                                width: 47.21,
                                                height: 48.72,
                                                child: Stack(
                                                    children:[Positioned(
                                                        left: 23.42,
                                                        top: 8,
                                                        child: Container(
                                                            width: 14.22,
                                                            height: 7.41,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                color: Color(0xff0f5d9a),
                                                            ),
                                                        ),
                                                    ),
                                                    Positioned(
                                                        left: 17,
                                                        top: 18.29,
                                                        child: Container(
                                                            width: 4.03,
                                                            height: 6.29,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                color: Color(0xff0f5d9a),
                                                            ),
                                                        ),
                                                    ),
                                                    Positioned.fill(
                                                        child: Align(
                                                            alignment: Alignment.bottomRight,
                                                            child: Container(
                                                                width: 46.05,
                                                                height: 46.05,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Stack(
                                                                    children:[
                                                                        Positioned.fill(
                                                                            child: Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Container(
                                                                                    width: 32.69,
                                                                                    height: 28.58,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                        color: Colors.white,
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned.fill(
                                                                            child: Align(
                                                                                alignment: Alignment.center,
                                                                                child: Container(
                                                                                    width: 34.87,
                                                                                    height: 18.20,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                        color: Color(0xff0f5d9a),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                    ),],
                                                ),
                                            ),
                                            SizedBox(width: 8.79),
                                            Text(
                                                "Doctor Virtual",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(    color: Color(0xff0f5d9a),
                                                    fontSize: 20,
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                    Container(
                        width: 411,
                        height: 586,
                        color: Colors.white,
                        child: Stack(
                            children:[
                                Positioned(
                                    left: 71,
                                    top: 379,
                                    child: Container(
                                        width: 225,
                                        height: 34,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Color(0x26000000),
                                                    blurRadius: 4,
                                                    offset: Offset(0, 4),
                                                ),
                                            ],
                                            color: Color(0xfff6f8fd),
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 81,
                                    top: 386,
                                    child: SizedBox(
                                        width: 191,
                                        height: 20,
                                        child: Text(
                                            "👋 Hello, I’m Dr.Virtual",
                                            style: TextStyle(    color: Color(0xff333333),
                                                fontSize: 13,
                                            ),
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 71,
                                    top: 420,
                                    child: Container(
                                        width: 259,
                                        height: 68,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Color(0x26000000),
                                                    blurRadius: 4,
                                                    offset: Offset(0, 4),
                                                ),
                                            ],
                                            color: Color(0xfff6f8fd),
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 81,
                                    top: 427,
                                    child: SizedBox(
                                        width: 239,
                                        height: 54,
                                        child: Text(
                                            "What concerns you most about your health? Please describe your symptoms.",
                                            style: TextStyle(    color: Color(0xff333333),
                                                fontSize: 13,
                                            ),
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 19,
                                    top: 379,
                                    child: Container(
                                        width: 40,
                                        height: 58.91,
                                        child: Stack(
                                            children:[Positioned.fill(
                                                child: Align(
                                                    alignment: Alignment.bottomLeft,
                                                    child: Container(
                                                        width: 40,
                                                        height: 36.60,
                                                        child: Stack(
                                                            children:[Positioned.fill(
                                                                child: Align(
                                                                    alignment: Alignment.topLeft,
                                                                    child: Container(
                                                                        width: 39.28,
                                                                        height: 36.60,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Colors.white,
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                                    alignment: Alignment.topLeft,
                                                                    child: Container(
                                                                        width: 40,
                                                                        height: 35.10,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Colors.black,
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),],
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned.fill(
                                                child: Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Container(
                                                        width: 23.42,
                                                        height: 25.92,
                                                        child: Stack(
                                                            children:[Container(
                                                                width: 23.42,
                                                                height: 25.92,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.white,
                                                                ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                                    alignment: Alignment.topLeft,
                                                                    child: Container(
                                                                        width: 23.42,
                                                                        height: 25.91,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Colors.black,
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),],
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 21.08,
                                                top: 74.84,
                                                child: Container(
                                                    width: 9.40,
                                                    height: 9.79,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 13.37,
                                                top: 75.41,
                                                child: Container(
                                                    width: 19.92,
                                                    height: 6.01,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                ),
                                            ),],
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 250,
                                    top: 515,
                                    child: Container(
                                        width: 147,
                                        height: 43,
                                        child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children:[
                                                Container(
                                                    width: 147,
                                                    height: 43,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: Color(0xff0f5d9a),
                                                    ),
                                                    padding: const EdgeInsets.only(left: 27, right: 26, top: 14, bottom: 13, ),
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            Text(
                                                                "Start Checkup",
                                                                style: TextStyle(    color: Colors.white,
                                                                    fontSize: 13,
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
                                    left: 20,
                                    top: 36,
                                    child: Container(
                                        width: 371.92,
                                        height: 279.48,
                                        child: Stack(
                                            children:[Positioned.fill(
                                                child: Align(
                                                    alignment: Alignment.bottomLeft,
                                                    child: Container(
                                                        width: 371.92,
                                                        height: 257.71,
                                                        child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children:[
                                                                Container(
                                                                    width: 152.11,
                                                                    height: 210.36,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        color: Color(0xffebebeb),
                                                                    ),
                                                                    padding: const EdgeInsets.only(left: 31, right: 33, top: 10, bottom: 16, ),
                                                                    child: Column(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children:[
                                                                            Opacity(
                                                                                opacity: 0,
                                                                                child: Container(
                                                                                    width: 80.63,
                                                                                    height: 13.82,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                        color: Color(0xfffafafa),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            SizedBox(height: 19.97),
                                                                            Opacity(
                                                                                opacity: 0,
                                                                                child: Container(
                                                                                    width: 23.71,
                                                                                    height: 40.93,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                        color: Color(0xfff5f5f5),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            SizedBox(height: 19.97),
                                                                            Opacity(
                                                                                opacity: 0,
                                                                                child: Container(
                                                                                    width: 23.71,
                                                                                    height: 22.99,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                        color: Color(0xfff5f5f5),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            SizedBox(height: 19.97),
                                                                            Opacity(
                                                                                opacity: 0,
                                                                                child: Container(
                                                                                    width: 24.32,
                                                                                    height: 3.94,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                        color: Color(0xffebebeb),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            SizedBox(height: 19.97),
                                                                            Opacity(
                                                                                opacity: 0,
                                                                                child: Container(
                                                                                    width: 23.71,
                                                                                    height: 22.98,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                        color: Color(0xfff5f5f5),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                        ],
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Container(
                                                                    width: 152.11,
                                                                    height: 210.36,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        color: Color(0xffebebeb),
                                                                    ),
                                                                    child: Stack(
                                                                        children:[
                                                                            Positioned(
                                                                                left: 4.08,
                                                                                top: 49.99,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 28.09,
                                                                                        height: 21.45,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Colors.white,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 29.31,
                                                                                top: 67.85,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 25.83,
                                                                                        height: 21.58,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Colors.white,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 28.61,
                                                                                top: 67.28,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 5.17,
                                                                                        height: 4.47,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Colors.white,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 37.17,
                                                                                top: 70.38,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 21.44,
                                                                                        height: 17.12,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Colors.white,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 92.48,
                                                                                top: 119.01,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 22.28,
                                                                                        height: 38.43,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Colors.white,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 63.98,
                                                                                top: 119.01,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 22.27,
                                                                                        height: 38.43,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Colors.white,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 87.76,
                                                                                top: 115.61,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 9.06,
                                                                                        height: 14.67,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Colors.white,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 81.91,
                                                                                top: 115.63,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 9.06,
                                                                                        height: 14.66,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Colors.white,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 101.83,
                                                                                top: 144.79,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 8.20,
                                                                                        height: 8.20,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Color(0xfff5f5f5),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 79.49,
                                                                                top: 129.60,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 4.63,
                                                                                        height: 7.91,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Color(0xfff5f5f5),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                        ],
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Container(
                                                                    width: 114.09,
                                                                    height: 208.33,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        color: Color(0xffebebeb),
                                                                    ),
                                                                    child: Stack(
                                                                        children:[
                                                                            Positioned.fill(
                                                                                child: Align(
                                                                                    alignment: Alignment.topLeft,
                                                                                    child: Opacity(
                                                                                        opacity: 0,
                                                                                        child: Container(
                                                                                            width: 102.35,
                                                                                            height: 203.27,
                                                                                            decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                                color: Colors.white,
                                                                                            ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Positioned(
                                                                                left: 21.17,
                                                                                top: 16.32,
                                                                                child: Opacity(
                                                                                    opacity: 0,
                                                                                    child: Container(
                                                                                        width: 23.71,
                                                                                        height: 171.65,
                                                                                        decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            color: Color(0xffebebeb),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                        ],
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Opacity(
                                                                    opacity: 0,
                                                                    child: Container(
                                                                        width: 371.92,
                                                                        height: 0.19,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Color(0xffebebeb),
                                                                        ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Opacity(
                                                                    opacity: 0,
                                                                    child: Container(
                                                                        width: 14.27,
                                                                        height: 0.19,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Color(0xffebebeb),
                                                                        ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Opacity(
                                                                    opacity: 0,
                                                                    child: Container(
                                                                        width: 32.13,
                                                                        height: 0.19,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Color(0xffebebeb),
                                                                        ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Opacity(
                                                                    opacity: 0,
                                                                    child: Container(
                                                                        width: 4.71,
                                                                        height: 0.19,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Color(0xffebebeb),
                                                                        ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Opacity(
                                                                    opacity: 0,
                                                                    child: Container(
                                                                        width: 69.68,
                                                                        height: 0.19,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Color(0xffebebeb),
                                                                        ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Opacity(
                                                                    opacity: 0,
                                                                    child: Container(
                                                                        width: 24.64,
                                                                        height: 0.19,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Color(0xffebebeb),
                                                                        ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Opacity(
                                                                    opacity: 0,
                                                                    child: Container(
                                                                        width: 6.46,
                                                                        height: 0.19,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Color(0xffebebeb),
                                                                        ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Opacity(
                                                                    opacity: 0,
                                                                    child: Transform.rotate(
                                                                        angle: 3.14,
                                                                        child: Container(
                                                                            width: 78.33,
                                                                            height: 12.47,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xffe6e6e6),
                                                                            ),
                                                                        ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 107.79),
                                                                Transform.rotate(
                                                                    angle: 3.14,
                                                                    child: Container(
                                                                        width: 155.41,
                                                                        height: 164.89,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color: Color(0xffebebeb),
                                                                        ),
                                                                        child: Stack(
                                                                            children:[
                                                                                Positioned.fill(
                                                                                    child: Align(
                                                                                        alignment: Alignment.topLeft,
                                                                                        child: Opacity(
                                                                                            opacity: 0,
                                                                                            child: Transform.rotate(
                                                                                                angle: 3.14,
                                                                                                child: Container(
                                                                                                    width: 153,
                                                                                                    height: 162.33,
                                                                                                    decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                                        color: Colors.white,
                                                                                                    ),
                                                                                                ),
                                                                                            ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                                Positioned(
                                                                                    left: 18.78,
                                                                                    top: 83.40,
                                                                                    child: Opacity(
                                                                                        opacity: 0,
                                                                                        child: Transform.rotate(
                                                                                            angle: -3.09,
                                                                                            child: Container(
                                                                                                width: 50.10,
                                                                                                height: 39.30,
                                                                                                decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    color: Color(0xfff0f0f0),
                                                                                                ),
                                                                                            ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                                Positioned(
                                                                                    left: 70.87,
                                                                                    top: 36.66,
                                                                                    child: Opacity(
                                                                                        opacity: 0,
                                                                                        child: Transform.rotate(
                                                                                            angle: 3.03,
                                                                                            child: Container(
                                                                                                width: 50.10,
                                                                                                height: 39.30,
                                                                                                decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    color: Color(0xfff0f0f0),
                                                                                                ),
                                                                                            ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                                Positioned.fill(
                                                                                    child: Align(
                                                                                        alignment: Alignment.topCenter,
                                                                                        child: Opacity(
                                                                                            opacity: 0,
                                                                                            child: Transform.rotate(
                                                                                                angle: -3.14,
                                                                                                child: Container(
                                                                                                    width: 73.16,
                                                                                                    height: 6.75,
                                                                                                    decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                                        color: Colors.white,
                                                                                                    ),
                                                                                                ),
                                                                                            ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                                Positioned(
                                                                                    left: 14.68,
                                                                                    top: 20.34,
                                                                                    child: Opacity(
                                                                                        opacity: 0,
                                                                                        child: Transform.rotate(
                                                                                            angle: 3.14,
                                                                                            child: Container(
                                                                                                width: 65.67,
                                                                                                height: 51.52,
                                                                                                decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    color: Color(0xffe6e6e6),
                                                                                                ),
                                                                                            ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                                Positioned(
                                                                                    left: 72.01,
                                                                                    top: 87.83,
                                                                                    child: Opacity(
                                                                                        opacity: 0,
                                                                                        child: Transform.rotate(
                                                                                            angle: 3.14,
                                                                                            child: Container(
                                                                                                width: 65.67,
                                                                                                height: 51.52,
                                                                                                decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    color: Color(0xffe6e6e6),
                                                                                                ),
                                                                                            ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 53.96,
                                                top: 131.97,
                                                child: Container(
                                                    width: 237.27,
                                                    height: 159.26,
                                                  child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            Container(
                                                                width: 237.27,
                                                                height: 159.26,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.90,
                                                                            child: Container(
                                                                                width: 237.27,
                                                                                height: 159.26,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
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
                                            Positioned(
                                                left: 46.22,
                                                top: 212.76,
                                                child: Container(
                                                    width: 26.39,
                                                    height: 126.83,
                                                    child: Stack(
                                                        children:[Positioned(
                                                            left: 5.64,
                                                            top: 7.58,
                                                            child: Container(
                                                                width: 14.25,
                                                                height: 74.92,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                padding: const EdgeInsets.only(left: 5, right: 2, top: 16, bottom: 39, ),
                                                                child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Container(
                                                                            width: 4,
                                                                            height: 6.96,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff0f5d9a),
                                                                            ),
                                                                        ),
                                                                        SizedBox(height: 7.71),
                                                                        Container(
                                                                            width: 5.48,
                                                                            height: 5.69,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff0f5d9a),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned.fill(
                                                            child: Align(
                                                                alignment: Alignment.bottomRight,
                                                                child: Container(
                                                                    width: 13.65,
                                                                    height: 47.78,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        color: Color(0xff263238),
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 3.66,
                                                            top: 13.27,
                                                            child: Container(
                                                                width: 6.21,
                                                                height: 4.84,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 18.29,
                                                            top: 56.41,
                                                            child: Container(
                                                                width: 4.21,
                                                                height: 6.74,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 2.97,
                                                            top: 0,
                                                            child: Container(
                                                                width: 4.47,
                                                                height: 5.14,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 4.47,
                                                                                height: 5.14,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 0.58,
                                                            top: 1.71,
                                                            child: Container(
                                                                width: 5.64,
                                                                height: 4.15,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 0.07,
                                                            top: 2.56,
                                                            child: Container(
                                                                width: 7.49,
                                                                height: 5.52,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Stack(
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 7.49,
                                                                                height: 5.52,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 7.49,
                                                                            height: 5.52,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff0f5d9a),
                                                                            ),
                                                                        ),
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 7.49,
                                                                                height: 5.52,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 3.28,
                                                            top: 0.31,
                                                            child: Container(
                                                                width: 5.61,
                                                                height: 6.77,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Container(
                                                                            width: 5.61,
                                                                            height: 6.77,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff0f5d9a),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 3.63,
                                                            top: 1.95,
                                                            child: Container(
                                                                width: 6.77,
                                                                height: 7.75,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 6.77,
                                                                                height: 7.75,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: -0,
                                                            top: 4.56,
                                                            child: Container(
                                                                width: 8.56,
                                                                height: 6.29,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 139.64,
                                                top: 63,
                                                child: Container(
                                                    width: 63.35,
                                                    height: 57.40,
                                                    child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children:[
                                                            Container(
                                                                width: 3.12,
                                                                height: 6.43,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                            SizedBox(height: 289.60),
                                                            Container(
                                                                width: 3.24,
                                                                height: 2.84,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                            SizedBox(height: 289.60),
                                                            Container(
                                                                width: 42.03,
                                                                height: 42.03,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.white,
                                                                ),
                                                                padding: const EdgeInsets.only(left: 5, right: 7, top: 5, bottom: 9, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Container(
                                                                            width: 29.51,
                                                                            height: 27.77,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff0f5d9a),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                            SizedBox(height: 289.60),
                                                            Container(
                                                                width: 5.79,
                                                                height: 3.44,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                            SizedBox(height: 289.60),
                                                            Container(
                                                                width: 8.65,
                                                                height: 2.62,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                            SizedBox(height: 289.60),
                                                            Container(
                                                                width: 21.19,
                                                                height: 10.67,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                            SizedBox(height: 289.60),
                                                            Transform.rotate(
                                                                angle: -1.34,
                                                                child: Container(
                                                                    width: 47.17,
                                                                    height: 47.17,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        color: Color(0xff0f5d9a),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 93.62,
                                                top: 108.88,
                                                child: Container(
                                                    width: 89.76,
                                                    height: 233.60,
                                                    child: Stack(
                                                        children:[Positioned(
                                                            left: 10.60,
                                                            top: 21.42,
                                                            child: Container(
                                                                width: 11.65,
                                                                height: 33.86,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 18.51,
                                                            top: 15.95,
                                                            child: Container(
                                                                width: 6.16,
                                                                height: 7.83,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 8.11,
                                                            top: 209.65,
                                                            child: Container(
                                                                width: 8.75,
                                                                height: 17.47,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffffc3bd),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 48.97,
                                                            top: 209.76,
                                                            child: Container(
                                                                width: 9.76,
                                                                height: 17.56,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffffc3bd),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 8.22,
                                                            top: 225.90,
                                                            child: Container(
                                                                width: 18.27,
                                                                height: 7.69,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 51.11,
                                                            top: 225.25,
                                                            child: Container(
                                                                width: 18.85,
                                                                height: 8.35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 24.96,
                                                            top: 81.87,
                                                            child: Container(
                                                                width: 33.16,
                                                                height: 135.79,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                padding: const EdgeInsets.only(left: 5, right: 19, top: 19, bottom: 86, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 9.14,
                                                                                height: 30.23,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 4.57,
                                                            top: 81.87,
                                                            child: Container(
                                                                width: 39.06,
                                                                height: 135.61,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 7.07,
                                                            top: 212.88,
                                                            child: Container(
                                                                width: 10.82,
                                                                height: 4.93,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffe0e0e0),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 48.82,
                                                            top: 213.11,
                                                            child: Container(
                                                                width: 10.30,
                                                                height: 4.80,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffe0e0e0),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 79.38,
                                                            top: 44.56,
                                                            child: Container(
                                                                width: 10.38,
                                                                height: 11.69,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffffc3bd),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 42.29,
                                                            top: 43.38,
                                                            child: Container(
                                                                width: 44.72,
                                                                height: 26.24,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.70,
                                                                            child: Container(
                                                                                width: 44.72,
                                                                                height: 26.24,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 14.86,
                                                            top: 37.07,
                                                            child: Container(
                                                                width: 38.58,
                                                                height: 46.13,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.white,
                                                                ),
                                                                padding: const EdgeInsets.only(bottom: 34, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 11.78,
                                                                                height: 11.80,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Color(0xff0f5d9a),
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        SizedBox(width: 0.44),
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 6.31,
                                                                                height: 10.84,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Color(0xff0f5d9a),
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 19.40,
                                                            top: 80.84,
                                                            child: Container(
                                                                width: 31.91,
                                                                height: 4.05,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 25.84,
                                                            top: 21.69,
                                                            child: Container(
                                                                width: 14.74,
                                                                height: 22.12,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffffc3bd),
                                                                ),
                                                                padding: const EdgeInsets.only(left: 4, right: 5, top: 3, bottom: 12, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 5.44,
                                                                                height: 6.77,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 4.56,
                                                            top: 36.62,
                                                            child: Container(
                                                                width: 28.63,
                                                                height: 120.35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.80,
                                                                            child: Container(
                                                                                width: 28.63,
                                                                                height: 120.35,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 39.34,
                                                            top: 37.07,
                                                            child: Container(
                                                                width: 20.33,
                                                                height: 118.86,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.80,
                                                                            child: Container(
                                                                                width: 20.33,
                                                                                height: 118.86,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 21.21,
                                                            top: 36.02,
                                                            child: Container(
                                                                width: 12.13,
                                                                height: 31.70,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 39.07,
                                                            top: 36.76,
                                                            child: Container(
                                                                width: 7.87,
                                                                height: 30.97,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 22.03,
                                                            top: 1.34,
                                                            child: Container(
                                                                width: 21.74,
                                                                height: 27.82,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffffc3bd),
                                                                ),
                                                                padding: const EdgeInsets.only(top: 7, bottom: 8, ),
                                                                child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Container(
                                                                            width: 3.44,
                                                                            height: 1.95,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 3.08,
                                                                            height: 2.27,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 1.38,
                                                                            height: 0.73,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 1.38,
                                                                            height: 0.73,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 1.44,
                                                                            height: 2.21,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 1.45,
                                                                            height: 2.21,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 8.33,
                                                                            height: 4.58,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Colors.white,
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 2.22,
                                                                            height: 0.68,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Colors.white,
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 8.51,
                                                                            height: 2.09,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Colors.white,
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 2.13,
                                                                            height: 4.50,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xffed847e),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 4.63,
                                                                            height: 2.04,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 17.56,
                                                            top: 5.04,
                                                            child: Container(
                                                                width: 11.02,
                                                                height: 13.50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 18.45,
                                                            top: 0,
                                                            child: Container(
                                                                width: 21.39,
                                                                height: 7.64,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 40.33,
                                                            top: 12.65,
                                                            child: Container(
                                                                width: 6.09,
                                                              height: 4.48,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.white,
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 20.88,
                                                            top: 15.45,
                                                            child: Container(
                                                                width: 5.81,
                                                                height: 6.89,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffffc3bd),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 25.46,
                                                            top: 70.46,
                                                            child: Container(
                                                                width: 29.57,
                                                                height: 31.50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.white,
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 25.40,
                                                            top: 71.42,
                                                            child: Container(
                                                                width: 31.97,
                                                                height: 33.08,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.30,
                                                                            child: Container(
                                                                                width: 31.97,
                                                                                height: 33.08,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 23.20,
                                                            top: 80.44,
                                                            child: Container(
                                                                width: 12.34,
                                                                height: 9.67,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffffc3bd),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 0,
                                                            top: 38.94,
                                                            child: Container(
                                                                width: 28.15,
                                                                height: 50.74,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.80,
                                                                            child: Container(
                                                                                width: 28.15,
                                                                                height: 50.74,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 176.41,
                                                top: 95.08,
                                                child: Container(
                                                    width: 134.40,
                                                    height: 247.40,
                                                    child: Stack(
                                                        children:[Positioned(
                                                            left: 22.01,
                                                            top: 35.86,
                                                            child: Container(
                                                                width: 26.78,
                                                                height: 55.45,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                                padding: const EdgeInsets.only(left: 3, right: 2, top: 10, bottom: 5, ),
                                                                child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                    children:[
                                                                        Container(
                                                                            width: 11.61,
                                                                            height: 20.30,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Colors.white,
                                                                            ),
                                                                        ),
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 1.05,
                                                                                height: 1.24,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 7,
                                                                            height: 19.61,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Colors.white,
                                                                            ),
                                                                        ),
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 1.05,
                                                                                height: 1.74,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 43.52,
                                                            top: 219.27,
                                                            child: Container(
                                                                width: 11.79,
                                                                height: 19.16,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                                padding: const EdgeInsets.only(right: 2, bottom: 8, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 10.11,
                                                                                height: 10.73,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 36.03,
                                                            top: 234.43,
                                                            child: Container(
                                                                width: 22.70,
                                                                height: 12.97,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 28.32,
                                                            top: 89.83,
                                                            child: Container(
                                                                width: 35.06,
                                                                height: 136.92,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                                padding: const EdgeInsets.only(left: 22, right: 7, top: 23, bottom: 86, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 6.66,
                                                                                height: 28.65,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 40.68,
                                                            top: 220.36,
                                                            child: Container(
                                                                width: 14.91,
                                                                height: 7.96,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 14.91,
                                                                                height: 7.96,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 68.80,
                                                            top: 224.44,
                                                            child: Container(
                                                                width: 9.02,
                                                                height: 17.88,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                                padding: const EdgeInsets.only(bottom: 9, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 8.76,
                                                                                height: 9.28,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 56.92,
                                                            top: 238.55,
                                                            child: Container(
                                                                width: 22.56,
                                                                height: 8.85,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 45.78,
                                                            top: 90.51,
                                                            child: Container(
                                                                width: 34.06,
                                                                height: 138.66,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 65.43,
                                                            top: 225.19,
                                                            child: Container(
                                                                width: 14.82,
                                                                height: 6.23,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 14.82,
                                                                                height: 6.23,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 33.92,
                                                            top: 33.33,
                                                            child: Container(
                                                                width: 42.98,
                                                                height: 60.50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                                child: Stack(
                                                                    children:[
                                                                        Positioned(
                                                                            left: 27.62,
                                                                            top: 22.30,
                                                                            child: Opacity(
                                                                                opacity: 0.20,
                                                                                child: Container(
                                                                                    width: 1.26,
                                                                                    height: 1.26,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                        color: Colors.black,
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned(
                                                                            left: 12.85,
                                                                            top: 11.59,
                                                                            child: Container(
                                                                                width: 8.95,
                                                                                height: 47.72,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned(
                                                                            left: 20.04,
                                                                            top: 11.85,
                                                                            child: Container(
                                                                                width: 16.13,
                                                                                height: 5.80,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned(
                                                                            left: 18.57,
                                                                            top: 18.55,
                                                                            child: Container(
                                                                                width: 19.39,
                                                                                height: 5.24,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned(
                                                                            left: 17.24,
                                                                            top: 26.84,
                                                                            child: Container(
                                                                                width: 18.57,
                                                                                height: 4.67,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned(
                                                                            left: 16.25,
                                                                            top: 34.22,
                                                                            child: Container(
                                                                                width: 17.02,
                                                                                height: 4.22,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned(
                                                                            left: 5.44,
                                                                            top: 11.96,
                                                                            child: Container(
                                                                                width: 11.61,
                                                                                height: 5.73,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned(
                                                                            left: 2.87,
                                                                            top: 18.56,
                                                                            child: Container(
                                                                                width: 13.99,
                                                                                height: 5.20,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned(
                                                                            left: 3.02,
                                                                            top: 26.83,
                                                                            child: Container(
                                                                                width: 13.59,
                                                                                height: 4.62,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Positioned(
                                                                            left: 3.70,
                                                                            top: 34.16,
                                                                            child: Container(
                                                                                width: 12.42,
                                                                                height: 4.18,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.white,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 30.76,
                                                            top: 85.52,
                                                            child: Container(
                                                                width: 9.73,
                                                                height: 10.03,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 46.07,
                                                            top: 19.52,
                                                            child: Container(
                                                                width: 18.81,
                                                                height: 21.27,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                                padding: const EdgeInsets.only(left: 7, right: 5, top: 2, bottom: 12, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children:[
                                                                        Opacity(
                                                                            opacity: 0.20,
                                                                            child: Container(
                                                                                width: 6.90,
                                                                                height: 6.41,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: Colors.black,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 46.20,
                                                            top: 11.60,
                                                            child: Container(
                                                                width: 2.83,
                                                                height: 7.15,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 47.01,
                                                            top: 0,
                                                            child: Container(
                                                                width: 20.69,
                                                                height: 26.21,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                                padding: const EdgeInsets.only(right: 8, top: 6, bottom: 7, ),
                                                                child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                        Container(
                                                                            width: 3.18,
                                                                            height: 1.70,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 2.96,
                                                                            height: 2.17,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 1.38,
                                                                            height: 2.05,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 1.37,
                                                                            height: 2.05,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 2.72,
                                                                            height: 5.46,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xffff5652),
                                                                            ),
                                                                        ),
                                                                        Container(
                                                                            width: 4.47,
                                                                            height: 1.14,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xffff8b7b),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 45.72,
                                                            top: 12.98,
                                                            child: Container(
                                                                width: 19.21,
                                                                height: 14.50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 62.23,
                                                            top: 12.97,
                                                            child: Container(
                                                                width: 6.50,
                                                                height: 7.21,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 63.56,
                                                            top: 35.81,
                                                            child: Container(
                                                                width: 27.91,
                                                                height: 55.55,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                                padding: const EdgeInsets.only(left: 11, right: 3, top: 10, bottom: 2, ),
                                                                child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                    children:[
                                                                        Container(
                                                                            width: 13.58,
                                                                            height: 21.34,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Colors.white,
                                                                            ),
                                                                        ),
                                                                        SizedBox(height: 3.17),
                                                                        Container(
                                                                            width: 11.38,
                                                                            height: 18.22,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Colors.white,
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 69.96,
                                                            top: 86.03,
                                                            child: Container(
                                                                width: 9.17,
                                                                height: 8.38,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 65.56,
                                                            top: 87.23,
                                                            child: Container(
                                                                width: 8.26,
                                                                height: 9.10,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xffff8b7b),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 131.12,
                                                            top: 69.97,
                                                            child: Container(
                                                                width: 3.27,
                                                                height: 17.26,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 133.70,
                                                            top: 92.28,
                                                            child: Container(
                                                                width: 0.70,
                                                                height: 4.05,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 117.94,
                                                            top: 69.66,
                                                            child: Container(
                                                                width: 14.01,
                                                                height: 177.75,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                padding: const EdgeInsets.only(top: 2, bottom: 166, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children:[
                                                                        Container(
                                                                            width: 10.41,
                                                                            height: 10.41,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Colors.white,
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 102.87,
                                                            top: 53.13,
                                                            child: Container(
                                                                width: 25.52,
                                                                height: 27.02,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                                padding: const EdgeInsets.only(right: 21, bottom: 13, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children:[
                                                                        Container(
                                                                            width: 4.78,
                                                                            height: 13.89,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xff263238),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 1.44,
                                                            top: 40.77,
                                                            child: Container(
                                                                width: 103.02,
                                                                height: 60.91,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff263238),
                                                                ),
                                                                padding: const EdgeInsets.only(left: 36, right: 34, top: 45, bottom: 5, ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                    children:[
                                                                        Container(
                                                                            width: 33.57,
                                                                            height: 11.53,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Colors.white,
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 1.74,
                                                            top: 40.81,
                                                            child: Container(
                                                                width: 102.42,
                                                                height: 60.91,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.white,
                                                                ),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            left: 0,
                                                            top: 39.29,
                                                            child: Container(
                                                                width: 105.93,
                                                                height: 63.86,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Color(0xff0f5d9a),
                                                                ),
                                                            ),
                                                        ),],
                                                    ),
                                                ),
                                            ),],
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                    Container(
                        width: 411,
                        height: 83,
                        child: Stack(
                            children:[
                                Container(
                                    width: 411,
                                    height: 83,
                                    child: Stack(
                                      children:[
                                            Positioned.fill(
                                                child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Container(
                                                        width: 411,
                                                        height: 82,
                                                        color: Color(0xffc4c4c4),
                                                    ),
                                                ),
                                            ),
                                            Positioned.fill(
                                                child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Container(
                                                        width: 102.75,
                                                        height: 83,
                                                        child: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children:[
                                                                Container(
                                                                    width: 102.75,
                                                                    height: 83,
                                                                    color: Color(0xffe2eeff),
                                                                    padding: const EdgeInsets.only(top: 11, bottom: 12, ),
                                                                    child: Column(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children:[

                                                                        ],
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 102.75,
                                                top: 0,
                                                child: Container(
                                                    width: 102.75,
                                                    height: 83,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            Container(
                                                                width: 102.75,
                                                                height: 83,
                                                                color: Color(0xffb5cbec),
                                                                padding: const EdgeInsets.only(left: 31, right: 32, top: 11, bottom: 12, ),
                                                                child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[

                                                                    ],
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 205.50,
                                                top: 0,
                                                child: Container(
                                                    width: 102.75,
                                                    height: 83,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            Container(
                                                                width: 102.75,
                                                                height: 83,
                                                                color: Color(0xffe2eeff),
                                                                padding: const EdgeInsets.only(top: 11, bottom: 12, ),
                                                                child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[

                                                                    ],
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned.fill(
                                                child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Container(
                                                        width: 102.75,
                                                        height: 83,
                                                        child: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children:[
                                                                Container(
                                                                    width: 102.75,
                                                                    height: 83,
                                                                    color: Color(0xffe2eeff),
                                                                    padding: const EdgeInsets.only(left: 27, right: 26, top: 8, bottom: 12, ),
                                                                    child: Column(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children:[

                                                                        ],
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                                Positioned(
                                    left: 343,
                                    top: 17,
                                    child: Container(
                                        width: 35,
                                        height: 35,
                                        padding: const EdgeInsets.symmetric(horizontal: 1, ),
                                        child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children:[
                                                Container(
                                                    width: 33.88,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                    padding: const EdgeInsets.only(left: 3, right: 16, top: 20, bottom: 3, ),
                                                    child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children:[
                                                            Container(
                                                                width: 4.55,
                                                                height: 1.81,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.black,
                                                                ),
                                                            ),
                                                            SizedBox(height: 0.08),
                                                            Container(
                                                                width: 7.61,
                                                                height: 9.81,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.black,
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
                                    left: 334,
                                    top: 55,
                                    child: Text(
                                        "Account",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(    color: Colors.black,
                                            fontSize: 13,
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 247,
                                    top: 15,
                                    child: Container(
                                        width: 33.36,
                                        height: 40,
                                        child: Stack(
                                            children:[Positioned(
                                                left: 3.80,
                                                top: 4.07,
                                                child: Container(
                                                    width: 7.65,
                                                    height: 1.18,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 3.80,
                                                top: 7.29,
                                                child: Container(
                                                    width: 14.95,
                                                    height: 1.18,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 3.80,
                                                top: 10.20,
                                                child: Container(
                                                    width: 14.95,
                                                    height: 1.18,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 3.80,
                                                top: 13.60,
                                                child: Container(
                                                    width: 10.28,
                                                    height: 1.18,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 4,
                                                top: 16.45,
                                                child: Container(
                                                    width: 7.39,
                                                    height: 7.39,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                ),
                                            ),
                                            Container(
                                                width: 33.36,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Colors.black,
                                                ),
                                                padding: const EdgeInsets.only(left: 21, right: 9, top: 27, bottom: 7, ),
                                                child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children:[
                                                        Container(
                                                            width: 3.93,
                                                            height: 1.18,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                color: Colors.black,
                                                            ),
                                                        ),
                                                        SizedBox(height: 1.51),
                                                        Container(
                                                            width: 3.93,
                                                            height: 1.18,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                color: Colors.black,
                                                            ),
                                                        ),
                                                        SizedBox(height: 1.51),
                                                        Container(
                                                            width: 3.93,
                                                            height: 1.18,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                color: Colors.black,
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                            ),],
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 238,
                                    top: 56,
                                    child: Text(
                                        "Records ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(    color: Colors.black,
                                            fontSize: 13,
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 134,
                                    top: 55,
                                    child: Text(
                                        "Doctor",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(    color: Colors.black,
                                            fontSize: 13,
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 139.26,
                                    top: 17,
                                    child: Container(
                                        width: 32.47,
                                        height: 35,
                                        child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children:[
                                                Container(
                                                    width: 32.47,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                    padding: const EdgeInsets.only(left: 20, right: 3, top: 26, bottom: 2, ),
                                                    child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children:[
                                                            Container(
                                                                width: 1.37,
                                                                height: 1.37,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.black,
                                                                ),
                                                            ),
                                                            SizedBox(height: 4.23),
                                                            Container(
                                                                width: 1.37,
                                                                height: 1.37,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.black,
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
                                    left: 30,
                                    top: 50,
                                    child: Text(
                                        "Home",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(    color: Colors.black,
                                            fontSize: 13,
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 33,
                                    top: 12,
                                    child: Container(
                                        width: 35,
                                        height: 35,
                                        padding: const EdgeInsets.symmetric(vertical: 2, ),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children:[
                                                Container(
                                                    width: 35,
                                                    height: 13.97,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                ),
                                                SizedBox(height: 0.03),
                                                Container(
                                                    width: 27.28,
                                                    height: 17.20,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black,
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        )

    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Me",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    response(text);
  }

  void response(text) {
    _textController.clear();
    ChatMessage message;
    if (text == "Yes" || text == "yes") {
      message = new ChatMessage(
        text:
            "Awesome! Your status has been updated. We look forward to seeing you!",
        name: "Blossom",
        type: false,
      );
    } else if (text == "No" || text == "no") {
      message = new ChatMessage(
        text:
            "So sorry to hear that you can't join the event! Do look out for our other events. Hope to see you soon!",
        name: "Blossom",
        type: false,
      );
    } else if (text == "What are badges?") {
      message = new ChatMessage(
        text:
            "Badges are a way to show your friends what you are most passionate about! You can earn badges by volunteering in relevant projects. Head over to the main page to see your progress towards getting the badges as well as which volunteering events can help you achieve certain badges!",
        name: "Blossom",
        type: false,
      );
    } else {
      message = new ChatMessage(
        text: "Sorry, I did not understand that.",
        name: "Blossom",
        type: false,
      );
    }
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildChatBody() {
    return new Flexible(
        child: new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      reverse: true,
      itemBuilder: (_, int index) => _messages[index],
      itemCount: _messages.length,
    ));
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://thumbs.dreamstime.com/b/smiling-woman-vector-illustration-young-happy-student-happy-girl-adult-beauty-person-healthy-71801962.jpg'),
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
              child: new Text(text, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(this.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://www.straitstimes.com/sites/default/files/styles/medium/public/articles/2017/09/10/st_20170910_cyyoungashley_3408138.jpg?itok=2ZyC_nAZ'),
          backgroundColor: Colors.transparent,
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
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
