import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panthion/new_note.dart';

import 'home_button.dart';
import 'mark_button.dart';
import 'all_marks.dart';
import 'new_note.dart';

class Notes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotesState();
}

class NotePreview extends StatelessWidget {
  final String _title;
  final String _content;

  NotePreview(this._title, this._content);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: NoteEditor(_title, _content),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              _title,
              style: TextStyle(fontSize: 32),
            ),
            subtitle: Text(
              _content,
              style: TextStyle(fontSize: 24),
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
    var list = ListView(
      children: <Widget>[
        for (int i = 0; i < 100; i++) NotePreview("Title", "Content")
      ],
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Marks"),
            centerTitle: true,
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 75,
        height: 75,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: null,
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
