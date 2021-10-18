import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  NewTransaction({Key? key, required this.addTx}) : super(key: key);

  void submitData() {
    final enteredTitle = titleInputController.text;
    final enteredAmount = double.parse(amountInputController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
                decoration: const InputDecoration(
                  labelText: "Amount",
                ),
                controller: amountInputController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData()),
            TextButton(
              onPressed: submitData,
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
