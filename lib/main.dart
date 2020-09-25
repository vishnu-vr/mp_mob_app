import 'package:flutter/material.dart';
import 'package:mathspartner/route_generator.dart';
import 'package:mathspartner/home.dart';
// import 'package:mathspartner/minor_info.dart';
// import 'package:mathspartner/major_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
      // home: MinorInfo(),
      // home: MajorInfo(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
