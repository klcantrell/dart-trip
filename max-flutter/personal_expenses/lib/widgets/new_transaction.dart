import 'package:flutter/material.dart';

typedef void HandleAdd(String title, double amount);

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final HandleAdd handleAdd;

  NewTransaction(this.handleAdd);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: titleController,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          controller: amountController,
        ),
        FlatButton(
          child: Text('Add Transaction'),
          textColor: Colors.purple,
          onPressed: () {
            handleAdd(
              titleController.text,
              double.parse(amountController.text),
            );
          },
        ),
      ],
    );
  }
}
