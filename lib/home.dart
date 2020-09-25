import 'package:flutter/material.dart';

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

class QuizList extends StatelessWidget {
  final List<String> testList = [
    "quiz-1",
    "quiz-2",
    "quiz-3",
    "quiz-4",
    "quiz-5",
    "quiz-6",
    "quiz-4",
    "quiz-5",
    "quiz-6",
    "quiz-4",
    "quiz-5",
    "quiz-6",
    "quiz-4",
    "quiz-5",
    "quiz-6",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this.testList.map((e) => QuizCard(e)).toList(),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String quizName;

  QuizCard(this.quizName);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      focusColor: Colors.white,
      onPressed: () => Navigator.of(context).pushNamed('/minor'),
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
