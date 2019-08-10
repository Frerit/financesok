import 'package:financesok/scenes/errors/NoFound.dart';
import 'package:financesok/scenes/home/HomePage.dart';
import 'package:financesok/scenes/login/LoginPage.dart';
import 'package:flutter/material.dart';

class RouterGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      default :
        return _errorRouter();

    }
  }
  static Route<dynamic> _errorRouter() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Error"),
          ),
          body: Center(
            child: Text("Error"),
          ),
        );
      }
    );
  }
}

