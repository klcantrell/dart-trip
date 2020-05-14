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
  var _totalScore = 0;

  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {
          'text': 'Blue',
          'score': 7,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'Red',
          'score': 9,
        },
        {
          'text': 'Purple',
          'score': 1,
        }
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Snake',
          'score': 4,
        },
        {
          'text': 'Otter',
          'score': 9,
        },
        {
          'text': 'Elephant',
          'score': 10,
        },
        {
          'text': 'Lion',
          'score': 11,
        }
      ],
    },
    {
      'questionText': 'What\'s your favorite video game?',
      'answers': [
        {
          'text': 'Final Fantasy',
          'score': 1,
        },
        {
          'text': 'Nier',
          'score': 2,
        },
        {
          'text': 'Pokemon',
          'score': 9,
        },
        {
          'text': 'Metal Gear Solid',
          'score': 3,
        }
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _totalScore = _totalScore + score;
      _questionIndex = _questionIndex + 1;
    });
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(_totalScore, _restartQuiz),
      ),
      theme: ThemeData.dark(),
    );
  }
}
