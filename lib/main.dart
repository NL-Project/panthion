import 'package:flutter/material.dart';

class APP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HOME(),
    );
  }
}

class HOME extends StatelessWidget {
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

