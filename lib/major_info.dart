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
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Text(
              "Name",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              this.info["name"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Divider(
              color: Colors.grey[600],
              height: 40,
            ),
            Row(
              children: [
                Text(
                  "Mark : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["mark"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "Correct : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["correct"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "Wrong : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["wrong"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "NA : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["na"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
