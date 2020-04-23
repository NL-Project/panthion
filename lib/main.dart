import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

final List<String> duties= <String>['23.05.2020', '24.05.2020', '25.05.2020'];

const String home = "Home";

void main() => runApp(Panthion());

class Panthion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panthion',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
        accentColor: Colors.white,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.indigo,
          shape: StadiumBorder(),
          textTheme: ButtonTextTheme.accent),
        appBarTheme: AppBarTheme(
          color: Colors.indigo),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white, fontSize: 26),
          headline: TextStyle(color: Colors.white, fontSize: 40))
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(title: Text("Next duty is on ${duties[0]}!"), centerTitle: true,),
          title: Text("Welcome, User!"))),
          body: Home()),
    );
  }
}

//---------HOME SCREEN HERE-------------------

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
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
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
              "Calendar",
              () => Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Calendar"),
                    ),
                  body: ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: duties.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 6,
                        color: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(20),
                          child: Text(
                            'Next duty is on ${duties[index]}',
                            style: TextStyle(fontSize: 24, color: Colors.white)),
                        onPressed: () {},)
                    );},
                    separatorBuilder: (BuildContext context, int index) => Divider())
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  String _text;
  Function _onPressed;
  HomeButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        elevation: 6,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(20),
        child: Text(_text, style: TextStyle(fontSize: 24),),
        onPressed: _onPressed,
      ),
    );
  }
}
