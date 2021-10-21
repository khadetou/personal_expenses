import "package:flutter/material.dart";
import "../widget/new_transaction.dart";
import "../widget/transaction_list.dart";
import "../widget/chart.dart";
import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: "t1",
    //   title: "New Shoes",
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "Weekly Groceries",
    //   amount: 16.99,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransaction {
    return _userTransactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTxt = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTxt);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(addTx: _addNewTransaction);
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      title: const Text("Personal Expenses"),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        )
      ],
    );
    return Scaffold(
      appBar: appBar2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.35) -
                  appBar2.preferredSize.height -
                  MediaQuery.of(context).padding.top,
              child: Chart(recentTransaction: _recentTransaction),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.65) -
                  appBar2.preferredSize.height -
                  MediaQuery.of(context).padding.top,
              child: TransactionList(
                transactions: _userTransactions,
                deleteTransaction: _deleteTransaction,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
