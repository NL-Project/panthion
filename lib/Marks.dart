import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panthion/NewMark.dart';

import 'home_button.dart';
import 'MarkButton.dart';
import 'AllMarks.dart';
import 'NewMark.dart';

class Marks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MarksState();
}

class _MarksState extends State<Marks> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    var markWidget = BottomAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            MarkButton(
              "New Mark",
                  () => Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: NewMark("New Mark","Write here...")
                ),
              ),
            ),
            Container(
              height: 100.0,
              child: ListView.builder(
                itemCount: values.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = values.keys.elementAt(index);
                  return new Column(
                    children: <Widget>[
                      new ListTile(
                        title: OldMarkButton(
                          "$key",
                              () => Navigator.of(context).push(
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: OldMark("$key", "${values[key]}")
                            ),
                          ),

                        ),
                        subtitle: new Text("${values[key]}"),
                      ),

                      new Divider(
                        height: 2.0,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],

        ),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Marks"),
                centerTitle: true,
              ),
              )),
      body: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? markWidget
            : SingleChildScrollView(
          child: markWidget,
        ),

      ),
    );
  }
}