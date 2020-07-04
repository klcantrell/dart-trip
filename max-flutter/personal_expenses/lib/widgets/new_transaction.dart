import 'package:flutter/material.dart';

typedef void HandleAdd(String title, double amount);

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final HandleAdd handlePress;

  NewTransaction(this.handlePress);

  void _submit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    handlePress(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: titleController,
          onSubmitted: (_) => _submit(),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          controller: amountController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => _submit(),
        ),
        FlatButton(
          child: Text('Add Transaction'),
          textColor: Colors.purple,
          onPressed: _submit,
        ),
      ],
    );
  }
}
