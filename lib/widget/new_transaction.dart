import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  NewTransaction({Key? key, required this.addTx}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
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
              controller: titleInputController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              controller: amountInputController,
            ),
            TextButton(
              onPressed: () {
                addTx(
                  titleInputController.text,
                  double.parse(amountInputController.text),
                );
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
    );
  }
}
