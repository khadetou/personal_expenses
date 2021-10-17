import "package:flutter/material.dart";
import "../models/transaction.dart";
import "package:intl/intl.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 16.99,
      date: DateTime.now(),
    ),
  ];

  // String? titleInput;
  // String? amountInput;
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Personal Expenses"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Title",
                      ),
                      // onChanged: (value) {
                      //   titleInput = value;
                      // },
                      controller: titleInputController,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Amount",
                      ),
                      // onChanged: (val) {
                      //   amountInput = val;
                      // },
                      controller: amountInputController,
                    ),
                    TextButton(
                      onPressed: () {
                        print(titleInputController.text);
                        print(amountInputController.text);
                      },
                      child: const Text(
                        "Add Transaction",
                        style: TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((transaction) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '\$${transaction.amount}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transaction.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMMd().format(transaction.date),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ));
  }
}
