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
          HomeButton(
            "Button 1",
            () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Button 1 has been pressed")));
            },
          ),
          HomeButton(
            "Button 2",
            () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Button 2 has been pressed")));
            },
          ),
          HomeButton(
            "Button 3",
            () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Button 3 has been pressed")));
            },
          ),
          HomeButton(
            "Button 4",
            () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Button 4 has been pressed")));
            },
          ),
        ],
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  String _text;
  Function _onPressed;
  HomeButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.transparent,
      textColor: Colors.red,
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(color: Colors.red, width: 3),
      ),
      child: Text(
        _text,
        style: TextStyle(fontSize: 50),
      ),
      onPressed: _onPressed,
    );
  }
}
