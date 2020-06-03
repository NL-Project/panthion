import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeButton extends StatelessWidget {
  Color _color;
  String _icon;
  String _text;
  Function _onPressed;
  HomeButton(this._color, this._icon, this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RawMaterialButton(
                onPressed: _onPressed,
                fillColor: _color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Container(padding: EdgeInsets.all(15),child: Image.asset(_icon)),
              ),
              Text(_text, style: Theme.of(context).textTheme.button)
            ]
        )
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