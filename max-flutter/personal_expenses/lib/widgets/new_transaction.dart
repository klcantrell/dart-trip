import 'package:flutter/material.dart';

typedef void HandleAdd(String title, double amount);

class NewTransaction extends StatefulWidget {
  final HandleAdd handlePress;

  NewTransaction(this.handlePress);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.handlePress(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
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
          textColor: Theme.of(context).primaryColor,
          onPressed: _submit,
        ),
      ],
    );
  }
}
