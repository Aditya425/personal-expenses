import 'package:flutter/material.dart';
import 'package:personal_expenses/modal/expense.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  final Function addExpense;

  AddExpense(this.addExpense);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime? _userDate;
  String amount = "";
  String title = "";

  void _addDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2006),
      lastDate: DateTime.now(),
    ).then((DateTime? date) {
      if (date == null) {
        return;
      }
      _userDate = date;
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
        child: Column(
          children: [
            Padding(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter expense name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor
                    )
                  )
                ),
                onChanged: (String val) {
                  title = val;
                },
              ),
              padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 10
              )
            ),
            Padding(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter amount",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor
                          )
                      )
                  ),
                  onChanged: (String val) {
                    amount = val;
                  },
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10
                )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      _userDate == null ? "Choose date" : DateFormat.yMMMd().format(_userDate!).toString(),
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {_addDate(context);},
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).primaryColor
                      )
                    ),
                    child: Text(
                      "Choose date",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: RaisedButton(
                  onPressed: () async {
                    Expense e = Expense(int.tryParse(amount)!, title, _userDate!, DateTime.now().toString());
                    Navigator.pop(context);
                    widget.addExpense(e);
                  },
                  child: Text(
                    "Add expense",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.title!.color
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
