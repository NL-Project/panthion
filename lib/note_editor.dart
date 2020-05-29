import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:panthion/notes_storage.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

import 'all_marks.dart';

class NoteEditor extends StatefulWidget {
  final int _noteId;
  final String _note;
  final Function() _notifyParent;

  NoteEditor(this._noteId, this._note, this._notifyParent);

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
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.save),
              onPressed: () => _saveDocument(context),
            ),
          )
        ],
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
    final Delta delta = Delta()..insert(widget._note + "\n");
    return NotusDocument.fromDelta(delta);
  }

  void _saveDocument(BuildContext context) {
    // Notus documents can be easily serialized to JSON by passing to
    // `jsonEncode` directly
    final contents = jsonEncode(_controller.document);
    // For this example we save our document to a temporary file.
//    final file = File(Directory.systemTemp.path + "/quick_start.json");
    // And show a snack bar on success.
//    file.writeAsString(contents).then((_) {
//      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved.")));
//    });
    NotesStorage.updateNote(widget._noteId, contents);
    widget._notifyParent();
  }
}
