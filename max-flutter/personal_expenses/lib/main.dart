import 'package:flutter/material.dart';

import 'widgets/user_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: ListView(
        children: [
          Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: Card(
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
          ]),
          UserTransactions(),
        ],
      ),
    );
  }
}
