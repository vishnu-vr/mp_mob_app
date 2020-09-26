import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mathspartner/loading.dart';
import 'package:mathspartner/api.dart' as api;

// ignore: must_be_immutable
class MinorInfo extends StatefulWidget {
  final String quizName;

  MinorInfo(this.quizName);

  var studentNames = [];
  var studentMarks = [];
  var correct = [];
  var wrong = [];
  var na = [];
  var date = [];
  var id = [];

  @override
  _MinorInfoState createState() => _MinorInfoState();
}

class _MinorInfoState extends State<MinorInfo> {
  @override
  void initState() {
    super.initState();
    getQuizData();
  }

  void getQuizData() async {
    var res = await api.getQuizData(this.widget.quizName);
    List studentList = jsonDecode(res.body);

    var studentNames = [];
    var studentMarks = [];
    var correct = [];
    var wrong = [];
    var na = [];
    var date = [];
    var id = [];

    for (int i = 0; i < studentList.length; i++) {
      studentNames.add(studentList[i]["name"]);
      studentMarks.add(studentList[i]["score"]);
      correct.add(studentList[i]["correct"]);
      wrong.add(studentList[i]["wrong"]);
      na.add(studentList[i]["na"]);
      date.add(studentList[i]["date"]);
      id.add(studentList[i]["id"]);
    }
    print(studentList);

    setState(() {
      this.widget.studentNames = studentNames;
      this.widget.studentMarks = studentMarks;
      this.widget.correct = correct;
      this.widget.wrong = wrong;
      this.widget.na = na;
      this.widget.date = date;
      this.widget.id = id;
    });
  }

  List<Widget> _buildCards() {
    List<Widget> ret = [];
    for (int i = 0; i < this.widget.studentNames.length; i++) {
      ret.add(StudentMinorInfo(
        this.widget.studentNames[i],
        this.widget.studentMarks[i],
        this.widget.correct[i],
        this.widget.wrong[i],
        this.widget.na[i],
        this.widget.date[i],
        this.widget.id[i],
        i + 1,
      ));
    }
    return ret;
  }

  Widget displayContent() {
    if (this.widget.studentNames.isNotEmpty) {
      return ListView(children: _buildCards());
    } else {
      return Loader();
    }
  }

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
        child: displayContent(),
      ),
    );
  }
}

class StudentMinorInfo extends StatelessWidget {
  final studentName;
  final studentMark;
  final correct;
  final wrong;
  final na;
  final date;
  final id;
  final int rank;

  StudentMinorInfo(this.studentName, this.studentMark, this.correct, this.wrong,
      this.na, this.date, this.id, this.rank);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.of(context).pushNamed('/major', arguments: {
        "name": studentName,
        "mark": studentMark,
        "correct": correct,
        "wrong": wrong,
        "na": na,
        "date": date,
        "rank": rank,
        "id": id,
      }),
      child: Container(
        child: Card(
          elevation: 8,
          color: Colors.orange[300],
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    this.studentName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Divider(color: Colors.black, height: 30),
                Text(
                  "Rank : " + this.rank.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                Divider(color: Colors.black, height: 20),
                Text(
                  "Mark : " + this.studentMark.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
