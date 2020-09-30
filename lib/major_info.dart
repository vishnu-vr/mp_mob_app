import 'package:flutter/material.dart';
import 'package:mathspartner/api.dart' as api;

// ignore: must_be_immutable
class MajorInfo extends StatelessWidget {
  MajorInfo(this.info);

  Map info;

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

// ignore: must_be_immutable
class DisplayInfo extends StatelessWidget {
  final Map info;
  Function getQuizData;

  DisplayInfo(this.info);

  void deleteAndPop(BuildContext context) {
    api.delete(this.info["id"].toString());
    getQuizData = this.info["getQuizData"];
    Navigator.pop(context);
    waitForASecondsAndReload();
  }

  void waitForASecondsAndReload() async {
    await Future.delayed(Duration(seconds: 1));
    getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.st,
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
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Rank : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["rank"].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Mark : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["mark"].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Correct : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["correct"].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Wrong : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["wrong"].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "NA : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["na"].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(height: 30),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Date : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  this.info["date"].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(height: 30),
            SizedBox(height: 20),
            RaisedButton(
              elevation: 5,
              color: Colors.red,
              onPressed: () => {deleteAndPop(context)},
              child: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
