import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: Column(
          children: [
            Question(_questions[_questionIndex]['questionText']),
            ...(_questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(
                      answer,
                      onPressed: _answerQuestion,
                    ))
                .toList(),
          ],
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}
