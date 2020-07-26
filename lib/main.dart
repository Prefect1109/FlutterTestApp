import 'package:flutter/material.dart';

void main() => runApp(SolidTestApp());

class SolidTestApp extends StatelessWidget {
  // This widget is the root of application.
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
  bool needToChange = false;
  String textToShow = "I Like Flutter";
  String appBarTitleToShow = "Welcome";

   var list = [Colors.green,
     Colors.lightBlue,
     Colors.blue,
     Colors.grey,
     Colors.white,
     Colors.purple,
     Colors.pink,
     Colors.amber,
     Colors.amberAccent,
     Colors.red,
     Colors.cyan,
     Colors.greenAccent,
   ];

  int random = 0;
  int randomMax = 12;

  Color containerBackGroundColor = Colors.white;

  void _updateText() {
    setState(() {
      // One text ot another - we choosing by boolean
      if (needToChange) {
        // Changing text in center
        textToShow = "Flutter looks good";
        // Changing text in navigation Bar
        appBarTitleToShow = "Welcome";

        // Getting semi-random int for next color
        if (random + 1 == randomMax) {
          random = 0;
        } else {
          random += 1;
        }
        // Getting selected color
        containerBackGroundColor = list[random];
        // Changing boolean on opposite
        needToChange = false;
      } else {
        // Changing text in center
        textToShow = "Flutter looks so good";
        // Changing text in navigation Bar
        appBarTitleToShow = "This is my First App";

        // Getting semi-random int for next color
        if (random + 1 == randomMax) {
          random = 0;
        } else {
          random += 1;
        }
        // Getting selected color
        containerBackGroundColor = list[random];
        // Changing boolean on opposite
        needToChange = true;

      }
    });
  }

  void _updateColor() {
    setState(() {
      // update the text
      if (needToChange) {
      } else {
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
        // Update text and backgroundColor on tap
        child: GestureDetector(
          onTap: () {
            _updateText();
          },
            child: Container(
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              color: containerBackGroundColor,
              child: Center(child: Text(textToShow))
         )
        ),
      ),
    );
  }
}