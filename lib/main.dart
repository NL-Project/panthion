import 'package:flutter/material.dart';

const String home = "Home";

void main() => runApp(Panthion());

class Panthion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panthion',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(home),
          ),
          body: Home()),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            color: Colors.transparent,
            textColor: Colors.red,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: Colors.red, width: 3),
            ),
            child: Text(
              "Button 1",
              style: TextStyle(fontSize: 50),
            ),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Button 1 has been pressed")));
            },
          ),
          FlatButton(
            color: Colors.transparent,
            textColor: Colors.red,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: Colors.red, width: 3),
            ),
            child: Text(
              "Button 2",
              style: TextStyle(fontSize: 50),
            ),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Button 2 has been pressed")));
            },
          ),
          FlatButton(
            color: Colors.transparent,
            textColor: Colors.red,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: Colors.red, width: 3),
            ),
            child: Text(
              "Button 3",
              style: TextStyle(fontSize: 50),
            ),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Button 3 has been pressed")));
            },
          ),
          FlatButton(
            color: Colors.transparent,
            textColor: Colors.red,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: Colors.red, width: 3),
            ),
            child: Text(
              "Button 4",
              style: TextStyle(fontSize: 50),
            ),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Button 4 has been pressed")));
            },
          ),
        ],
      ),
    );
  }
}
