import 'package:flutter/material.dart';

import 'all_marks.dart';

class OldMark extends StatefulWidget {

  String titletext;
  String _marktext;


  OldMark(String titletext, String marktext) {
    this.titletext = titletext;
    this._marktext = marktext;

  }


  @override
  State<StatefulWidget> createState() => _OldMarkState();

}

class _OldMarkState extends State<OldMark> {






  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "";

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: widget._marktext);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  Widget _editTitleTextField() {

    if (_isEditingText)
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              widget._marktext = newValue;
              values[widget.titletext] = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      );
    return InkWell(

      onTap: () {
        setState(() {

          _isEditingText = true;
        });
      },
      child: Text(
        widget._marktext,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titletext ?? 'default value'),
      ),
      body: Center(
        child: _editTitleTextField(),
      ),
    );
  }
}
