import 'package:flutter/material.dart';

import '../models/trasaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover)),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, idx) {
              return TransactionItem(
                  transaction: transactions[idx],
                  mediaQuery: mediaQuery,
                  onRemove: onRemove);
            },
            itemCount: transactions.length,
          );
  }
}
