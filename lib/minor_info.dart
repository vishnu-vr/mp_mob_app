import 'package:flutter/material.dart';

class MinorInfo extends StatelessWidget {
  final List studentNamesAndMarks = [
    {"name": "Achuth M Menon", "mark": "90"},
    {"name": "ramesh", "mark": "100"},
    {"name": "achu", "mark": "60"},
    {"name": "madhu", "mark": "88"},
    {"name": "vishnu", "mark": "22"},
    {"name": "suresh", "mark": "100"},
    {"name": "manju", "mark": "99"},
    {"name": "gayathri", "mark": "100"},
  ];

  List<Widget> _buildCards() {
    List<Widget> ret = [];
    for (int i = 0; i < this.studentNamesAndMarks.length; i++) {
      ret.add(StudentMinorInfo(this.studentNamesAndMarks[i], i + 1));
    }
    return ret;
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
        child: ListView(
          children: _buildCards(),
        ),
      ),
    );
  }
}

class StudentMinorInfo extends StatelessWidget {
  final Map studentDetails;
  final int rank;

  StudentMinorInfo(this.studentDetails, this.rank);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.of(context).pushNamed('/major'),
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
                    this.studentDetails["name"],
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
                  "Mark : " + this.studentDetails["mark"],
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
