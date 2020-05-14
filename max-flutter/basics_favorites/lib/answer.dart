import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  static _defaultOnPressed() => print('onPressed not set');
  final String answerText;
  final void Function() onPressed;

  Answer(this.answerText, {this.onPressed = _defaultOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        textColor: Colors.white,
        onPressed: onPressed,
        color: Colors.pinkAccent,
      ),
    );
  }
}
