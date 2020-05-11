import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  static _defaultOnPressed(String value) => print('onPressed not set');
  final String answerText;
  final void Function(String) onPressed;

  Answer(this.answerText, {this.onPressed = _defaultOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        textColor: Colors.white,
        onPressed: () => onPressed(answerText),
        color: Colors.pinkAccent,
      ),
    );
  }
}
