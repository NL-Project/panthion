import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'home_button.dart';

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


    final Map<String, String> values = {'Mark 1': 'Bla-bla-bla', 'Mark2': 'Bla-bla', 'Mark3' : 'OK, not funny'}; //в значение будем заносить первые 10 символов, например


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
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("New Mark"),
                    ),
                    body: Column(
                      children: <Widget>[
                        Container(
                            child: TextFormField(maxLines: 50)
                        )

                      ],
                    ),

                  ),
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
                              child: Scaffold(
                                appBar: AppBar(
                                  title: Text("$key"),
                                ),
                                body: Column(
                                  children: <Widget>[
                                    Container(
                                        child: TextFormField(maxLines: 50)
                                    )
                                  ],
                                ),

                              ),
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