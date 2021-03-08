import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePageProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/smiling-woman-vector-illustration-young-happy-student-happy-girl-adult-beauty-person-healthy-71801962.jpg'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Animal Lover Badge",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width / 2,
                        lineHeight: 20,
                        progressColor: Colors.green,
                        percent: 0.7),
                  ],
                ),
                Text(
                  "70%",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://www.jing.fm/clipimg/detail/325-3254388_reuse-reduce-recycle-vector-png.png'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Recycle Guru Badge",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width / 2,
                        lineHeight: 20,
                        progressColor: Colors.green,
                        percent: 0.5),
                  ],
                ),
                Text(
                  "50%",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
