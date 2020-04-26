import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

import 'calendar.dart';

const String home = "Home";

void main() => runApp(Panthion());

class Panthion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panthion',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome, USER'),
          ),
          backgroundColor: Colors.teal[100],
          body: Home()),
    );
  }
}

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
    return OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? mainWidget
            : SingleChildScrollView(
                child: mainWidget,
              ));
  }
}

class HomeButton extends StatelessWidget {
  String _text;
  Function _onPressed;
  HomeButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 280,
        child: RaisedButton(
          elevation: 6,
          color: Colors.deepOrangeAccent,
          textColor: Colors.white,
          padding: const EdgeInsets.all(25),
          shape: StadiumBorder(),
          child: Text(
            _text,
            style: TextStyle(fontSize: 30),
          ),
          onPressed: _onPressed,
        ),
      ),
    );
  }
}
