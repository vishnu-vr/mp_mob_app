import 'dart:convert';
import 'package:mathspartner/loading.dart';
import 'package:flutter/material.dart';
import 'package:mathspartner/api.dart' as api;

class Home extends StatelessWidget {
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
        padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
        child: QuizList(),
        // child: MinorInfo(),
      ),
    );
  }
}

class QuizList extends StatefulWidget {
  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  @override
  void initState() {
    super.initState();
    getQuizNames();
  }

  void getQuizNames() async {
    var res = await api.getQuizNames();
    List quizList = jsonDecode(res.body);
    // List<String> quiz;
    List<String> quizNames = [];
    for (int i = 0; i < quizList.length; i++) {
      quizNames.add(quizList[i]["quiz_name"]);
    }
    print(quizNames);
    setState(() {
      this.testList = quizNames;
    });
  }

  List<String> testList = [];

  Future<Null> pageRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    print("being refreshed");
    getQuizNames();
  }

  Widget displayContent() {
    if (this.testList.isNotEmpty) {
      return ListView(
        children:
            this.testList.map((e) => QuizCard(e, this.getQuizNames)).toList(),
      );
    } else {
      return Loader();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: displayContent(),
      onRefresh: pageRefresh,
    );
  }
}

class QuizCard extends StatelessWidget {
  final String quizName;
  final Function getQuizNames;

  QuizCard(this.quizName, this.getQuizNames);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      focusColor: Colors.white,
      onPressed: () => Navigator.of(context)
          .pushNamed('/minor', arguments: [this.quizName, this.getQuizNames]),
      child: Card(
        elevation: 20,
        color: Colors.orange[300],
        child: ListTile(
          leading: Icon(Icons.question_answer),
          title: Text(
            this.quizName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
