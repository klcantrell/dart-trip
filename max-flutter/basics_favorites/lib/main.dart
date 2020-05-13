import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Blue', 'Green', 'Red', 'Purple'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Snake', 'Otter', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'What\'s your favorite video game?',
      'answers': ['Final Fantasy', 'Nier', 'Pokemon', 'Metal Gear Solid'],
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(),
      ),
      theme: ThemeData.dark(),
    );
  }
}
