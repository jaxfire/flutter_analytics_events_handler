import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class TheText extends ChangeNotifier {
  String theText = 'Initial Text';

  void updateText(String newText) {
    theText = newText;
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TheText theText;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TheText>(
      create: (context) => TheText(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyTextTitle(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class MyTextTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<TheText>(context).theText);
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Provider.of<TheText>(context).theText),
    );
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String newValue) =>
          Provider.of<TheText>(context, listen: false).updateText(newValue),
    );
  }
}
