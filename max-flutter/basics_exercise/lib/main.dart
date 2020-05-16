import 'package:flutter/material.dart';

import './message.dart';
import './button.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  String _message = 'Hello!';

  void _updateMessage() {
    setState(() => _message = 'Goodbye...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Basics Exercise')),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Message(_message),
                Button(_updateMessage),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          padding: EdgeInsets.only(bottom: 300),
        ),
      ),
    );
  }
}
