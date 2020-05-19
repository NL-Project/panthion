import 'package:flutter/material.dart';

import 'AllMarks.dart';

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
  String _titletext;
  String _marktext;

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
              initialText = widget._marktext;
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
