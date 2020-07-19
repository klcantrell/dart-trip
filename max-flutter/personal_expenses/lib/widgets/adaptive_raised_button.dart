import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveRaisedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  AdaptiveRaisedButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            padding: EdgeInsets.only(left: 15, right: 15),
            color: Theme.of(context).primaryColor,
            child: Text(text),
            onPressed: onPressed,
          )
        : RaisedButton(
            child: Text(text),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
            onPressed: onPressed,
          );
  }
}
