class Note {
  String _text, _date;
  int _id;

  Note.update(this._text, this._date, this._id);

  Note(this._text, this._date);

  Note.map(dynamic obj) {
    this._text = obj['text'];
    this._date = obj['date'];
    this._id = obj['id'];
  }

  Note.fromMap(Map<String, dynamic> map) {
    this._text = map['text'];
    this._id = map['id'];
    this._date = map['date'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();

    map['text'] = this._text;
    map['date'] = this._date;

    if (id != null) map['id'] = this._id;

    return map;
  }

  get text => _text;

  set text(value) {
    _text = value;
  }

  get date => _date;

  set date(value) {
    _date = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
