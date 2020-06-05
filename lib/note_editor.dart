import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:panthion/notes_storage.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

import 'all_marks.dart';

class NoteEditor extends StatefulWidget {
  final int _noteId;
  final Function() _notifyParent;
  final bool _isNew;

  NoteEditor(this._noteId, this._notifyParent, this._isNew);

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
    var note = NotesStorage.allNotes[widget._noteId];
    if (widget._isNew) {
      final Delta delta = Delta()..insert(note + "\n");
      return NotusDocument.fromDelta(delta);
    }
    return NotusDocument.fromJson(jsonDecode(note));
  }

  void _saveDocument(BuildContext context) {
    final contents = jsonEncode(_controller.document);
//    file.writeAsString(contents).then((_) {
//      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved.")));
//    });
    NotesStorage.updateNote(widget._noteId, contents);
    widget._notifyParent();
  }
}
