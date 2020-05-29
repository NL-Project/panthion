import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panthion/home.dart';

const String home = "Home";

void main() => runApp(Panthion());

class Panthion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panthion',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepPurple[400],
          accentColor: Colors.white,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.deepPurple[400],
              textTheme: ButtonTextTheme.accent),
          appBarTheme: AppBarTheme(color: Colors.deepPurple[400]),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.white, fontSize: 26),
              headline: TextStyle(color: Colors.white, fontSize: 40))),
      home: Home(),
    );
  }
}
