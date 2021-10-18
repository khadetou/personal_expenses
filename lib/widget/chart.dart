import "package:flutter/material.dart";
import "../models/transaction.dart";
import "package:intl/intl.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;
        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalSum += recentTransaction[i].amount;
          }
        }

        print(DateFormat.E(weekDay));
        print(totalSum);
        return {
          "day": DateFormat.E(weekDay),
          "amount": totalSum,
        };
      },
    );
  }

  Chart({required this.recentTransaction});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
