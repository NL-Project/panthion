import 'package:flutter/material.dart';

//INITIALIZING THE APP

void main() => runApp(APP());

class APP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: Home(),
    );
  }
}

//CREATING BUTTONS FOR HOME SCREEN

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            child: Text("Button 1"),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text("Button 2"),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text("Button 3"),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text("Button 4"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

