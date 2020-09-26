import 'package:flutter/material.dart';
import 'package:mathspartner/minor_info.dart';
import 'package:mathspartner/major_info.dart';
import 'package:mathspartner/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/minor':
        return MaterialPageRoute(
          builder: (_) => MinorInfo(args),
        );
      case '/major':
        return MaterialPageRoute(
          builder: (_) => MajorInfo(args),
        );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
