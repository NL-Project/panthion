import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panthion/calendar.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

import 'home_button.dart';

final List<String> duties = <String>['23.05.2020', '24.05.2020', '25.05.2020'];

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String version;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      PdftronFlutter.initialize(
          "Insert commercial license key here after purchase");
      version = await PdftronFlutter.version;
    } catch (e) {
      version = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    var mainWidget = Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            HomeButton(
              "Instructions",
              // TODO: doesn't work without internet
              () => PdftronFlutter.openDocument(
                  "https://file-examples.com/wp-content/uploads/2017/02/file-sample_1MB.docx"),
            ),
            HomeButton(
              "Button 2",
              () => Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Empty Screen"),
                    ),
                  ),
                ),
              ),
            ),
            HomeButton(
              "Button 3",
              () => Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Empty Screen"),
                    ),
                  ),
                ),
              ),
            ),
            HomeButton(
              "Button 4",
              () => Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: Calendar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Next duty is on ${duties[0]}!"),
                centerTitle: true,
              ),
              title: Text("Welcome, User!"))),
      body: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? mainWidget
            : SingleChildScrollView(
                child: mainWidget,
              ),
      ),
    );
  }
}
