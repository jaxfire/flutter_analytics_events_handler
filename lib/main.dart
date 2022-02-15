import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String theText = 'Initial Text';

  void theCallback(String newValue) {
    setState(() {
      theText = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(theText),
        ),
        body: Level1(theCallback, theText),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  final Function theCallback;
  final String theText;

  Level1(this.theCallback, this.theText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(theCallback, theText),
    );
  }
}

class Level2 extends StatelessWidget {
  final Function theCallback;
  final String theText;

  Level2(this.theCallback, this.theText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(theCallback),
        Level3(theText),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  final String theText;
  Level3(this.theText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(theText),
    );
  }
}

class MyTextField extends StatelessWidget {
  final Function theCallback;
  MyTextField(this.theCallback);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: theCallback,
    );
  }
}
