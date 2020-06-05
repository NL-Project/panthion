import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panthion/note_editor.dart';
import 'package:panthion/notes_storage.dart';
import 'package:quill_delta/quill_delta.dart';

import 'home_button.dart';
import 'mark_button.dart';
import 'all_marks.dart';
import 'note_editor.dart';

class Notes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotesState();
}

class NotePreview extends StatelessWidget {
  final int _id;
  final String _content;
  final Function() _notifyParent;

  NotePreview(this._id, this._content, this._notifyParent);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: NoteEditor(_id, _notifyParent, false),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              jsonDecode(_content)[0]['insert'].trim(),
              style: TextStyle(fontSize: 32),
              softWrap: false,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    var list = ListView.builder(itemBuilder: (context, i) {
      var key = NotesStorage.allNotes.keys.elementAt(i);
      return NotePreview(key, NotesStorage.allNotes[key], () => setState(() {}));
    },
    itemCount: NotesStorage.allNotes.length,);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Notes"),
            centerTitle: true,
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 75,
        height: 75,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              NotesStorage.createNote(jsonEncode(Delta()..insert("Empty note" + "\n")));
              setState(() {});
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
