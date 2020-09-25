import 'package:flutter/material.dart';

class MajorInfo extends StatelessWidget {
  final Map info = {
    "name": "vishnu ramesh",
    "mark": "90",
    "correct": "10",
    "wrong": "20",
    "na": "70",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "MathsPartner",
          style: TextStyle(
            letterSpacing: 1,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
        // child: FirstPage(),
        child: DisplayInfo(info),
      ),
    );
  }
}

class DisplayInfo extends StatelessWidget {
  final Map info;
  DisplayInfo(this.info);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.info["name"],
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
