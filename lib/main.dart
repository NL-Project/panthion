import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panthion/home.dart';

import 'calendar.dart';

const String home = "Home";

void main() => runApp(Panthion());

class Panthion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panthion',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.indigo,
          accentColor: Colors.white,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.indigo,
              shape: StadiumBorder(),
              textTheme: ButtonTextTheme.accent),
          appBarTheme: AppBarTheme(color: Colors.indigo),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.white, fontSize: 26),
              headline: TextStyle(color: Colors.white, fontSize: 40))),
      home: Home(),
    );
  }
}
