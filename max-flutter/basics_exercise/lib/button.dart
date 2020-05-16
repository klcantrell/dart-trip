import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;

  Button(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Update message'),
      onPressed: onPressed,
    );
  }
}
