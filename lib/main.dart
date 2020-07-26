import 'package:flutter/material.dart';

void main() => runApp(SolidTestApp());

class SolidTestApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text
  bool needToChange = false;
  String textToShow = "I Like Flutter";
  String appBarTitleToShow = "Welcome";
  Color backGroundColor = Colors.grey;
  void _updateText() {
    setState(() {
      // update the text
      if (needToChange) {
         textToShow = "Flutter looks good";
         appBarTitleToShow = "Welcome";
         backGroundColor = Colors.grey;
         needToChange = false;
      } else {
        textToShow = "Flutter looks so good";
        appBarTitleToShow = "This is my First App";
        backGroundColor = Colors.lightBlue;
        needToChange = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitleToShow),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _updateText();
          },
            child: Container(
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              color: backGroundColor,
              child: Center(child: Text(textToShow))
         )
        ),
      ),
    );
  }
}