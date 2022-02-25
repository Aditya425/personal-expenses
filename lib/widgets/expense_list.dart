import 'package:flutter/material.dart';
import 'package:personal_expenses/modal/expense.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatefulWidget {
  late final List<Expense> userExpenses;

  ExpenseList({required this.userExpenses});

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
        itemCount: widget.userExpenses.length,
        itemBuilder: (BuildContext context, int itemCount) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  "${widget.userExpenses[itemCount].amount}"
                ),
              radius: 30,
              ),
              title: Text(
                "${widget.userExpenses[itemCount].name}"
              ),
              subtitle: Text(
                "${DateFormat.yMMMd().format(widget.userExpenses[itemCount].date)}"
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).errorColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
