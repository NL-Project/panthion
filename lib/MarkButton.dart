import 'package:flutter/material.dart';

import 'AllMarks.dart';


class oldMark extends StatefulWidget {
  String _titletext;
  String _marktext;

  oldMark(String titletext, String marktext) {
    this._titletext = titletext;
    this._marktext = marktext;
  }
  @override
  State<StatefulWidget> createState() => _oldMarkState();
}


class _oldMarkState extends State<oldMark> {

  String _titletext;
  String _marktext;

  oldMark(String titletext, String marktext) {
    this._titletext = titletext;
    this._marktext = marktext;
  }

  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "";

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
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
          onSubmitted: (newValue){
            setState(() {
              initialText = _marktext;
              _isEditingText =false;
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
        initialText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text(_titletext??'default value'),
      ),
      body: Center(
        child: _editTitleTextField(),
      ),
    );
  }
}



