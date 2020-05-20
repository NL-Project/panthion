import 'package:flutter/material.dart';

import 'AllMarks.dart';

class NewMark extends StatefulWidget {

  String titletext;
  String _marktext;


  NewMark(String titletext, String marktext) {
    this.titletext = titletext;
    this._marktext = marktext;

  }


  @override
  State<StatefulWidget> createState() => _NewMarkState();

}

class _NewMarkState extends State<NewMark> {






  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "";
  final int len = values.length + 1;


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
              values["Mark" + len.toString()] = widget._marktext;
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
