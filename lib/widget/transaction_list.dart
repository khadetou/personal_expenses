import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: const <Widget>[
                Text("No transaction added yet!"),
                SizedBox(
                  height: 20,
                ),
                Image(
                  height: 200,
                  image: AssetImage("assets/images/waiting.png"),
                  fit: BoxFit.cover,
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text(
                              "\$${transactions[index].amount}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )),
                );
              },
            ),
    );
  }
}
