import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:panthion/models/note.dart';
import 'package:zefyr/zefyr.dart';

class NoteEditor extends StatefulWidget {
  final Note _note;
  final Function(Note) _onSave;

  NoteEditor(this._note, this._onSave);

  @override
  State<StatefulWidget> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // Note that the editor requires special `ZefyrScaffold` widget to be
    // one of its parents.
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Editor"),

      ),
      body: ZefyrScaffold(
        child: ZefyrEditor(
          padding: EdgeInsets.all(16),
          controller: _controller,
          focusNode: _focusNode,
        ),
      ),
    );
  }

  /// Loads the document to be edited in Zefyr.
  NotusDocument _loadDocument() {
    return NotusDocument.fromJson(jsonDecode(widget._note.text));
  }

  void _saveDocument() {
    final contents = jsonEncode(_controller.document);
    widget._note.text = contents;
    widget._onSave(widget._note);
  }

  @override
  void dispose() {
    _saveDocument();
    super.dispose();
  }
}
