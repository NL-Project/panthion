import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panthion/database/db_helper.dart';
import 'package:panthion/models/note.dart';
import 'package:panthion/ui/note_editor.dart';
import 'package:quill_delta/quill_delta.dart';

class Notes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotesState();
}

class NotePreview extends StatelessWidget {
  final Note _note;
  final Function(Note) _onSave;

  NotePreview(this._note, this._onSave);

  void _onTap(BuildContext context) {
    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: NoteEditor(_note, _onSave),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: Theme.of(context).primaryColor,

          ),
        ),
      ),
      child: InkWell(
          onTap: () => _onTap(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                jsonDecode(_note.text)[0]['insert'].trim(),
                style: TextStyle(fontSize: 32),
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
              subtitle: Text(
                _note.date,
              ),
            ),
          ),
      ),
    );
  }
}

class _NotesState extends State<Notes> {
  final DatabaseHelper _db = DatabaseHelper();
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _db.getAllNotes().then((value) => setState(() => _notes = value));
  }

  Future<void> _createNote() async {
    var note = Note(jsonEncode(Delta()..insert("Empty note" + "\n")),
        DateTime.now().toString());
    int id = await _db.insertNote(note);
    note.id = id;
    setState(() => _notes.insert(0, note));
  }

  Future<void> _saveNote(Note note) async {
    note.date = DateTime.now().toString();
    await _db.updateItem(note);
    setState(() {});
  }

  Future<void> _deleteNote(Note note) async {
    await _db.deleteItem(note.id);
    setState(() {
      _notes.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    ListView list = ListView.builder(
      itemBuilder: (context, i) {
        return Slidable(child: NotePreview(_notes[i], _saveNote),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => _deleteNote(_notes[i]),
            ),
          ],
        );
      },
      itemCount: _notes.length,
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text("Tips"),
          centerTitle: true,
        ),
      ),
      floatingActionButton: Container(
        width: 75,
        height: 75,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async {
              await _createNote();
            },
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: list,
        ),
      ),
    );
  }
}
