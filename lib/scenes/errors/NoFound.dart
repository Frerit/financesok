import 'package:flutter/material.dart';

class NoFoundPage extends StatefulWidget {
  @override
  _NoFoundPageState createState() => _NoFoundPageState();
}

class _NoFoundPageState extends State<NoFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Error',
            ),
          ],
        ),
      ),
    );
  }
}
