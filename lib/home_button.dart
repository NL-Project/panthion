import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  String _text;
  Function _onPressed;
  HomeButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 280,
        child: RaisedButton(
          elevation: 6,
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(25),
          shape: StadiumBorder(),
          child: Text(
            _text,
            style: TextStyle(fontSize: 30),
          ),
          onPressed: _onPressed,
        ),
      ),
    );
  }
}

class MarkButton extends StatelessWidget {
  String _text;
  Function dosomething;
  MarkButton(this._text, this.dosomething);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 100,
        child: RaisedButton(
          elevation: 3,
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(3),
          shape: StadiumBorder(),
          child: Text(
            _text,
            style: TextStyle(fontSize: 20),
          ),
          onPressed: dosomething,
        ),
      ),




    );
  }
}



class OldMarkButton extends StatelessWidget {
  String _text;
  Function dosomething;
  OldMarkButton(this._text, this.dosomething);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 80,
        child: RaisedButton(
          elevation: 3,
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(15),
          shape: StadiumBorder(),
          child: Text(
            _text,
            style: TextStyle(fontSize: 20),
          ),
          onPressed: dosomething,
        ),
      ),
    );
  }
}