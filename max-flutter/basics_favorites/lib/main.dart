import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
      'What\'s your favorite video game?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Question 1'),
              onPressed: () => setState(() => questionIndex = 0),
            ),
            RaisedButton(
              child: Text('Question 2'),
              onPressed: () => setState(() => questionIndex = 1),
            ),
            RaisedButton(
              child: Text('Question 3'),
              onPressed: () => setState(() => questionIndex = 2),
            ),
          ],
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}
