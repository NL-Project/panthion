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
          color: Colors.deepOrangeAccent,
          textColor: Colors.white,
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
