import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/add_expense.dart';
import 'package:personal_expenses/widgets/expense_list.dart';

import 'modal/expense.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        errorColor: Colors.redAccent,
        primarySwatch: Colors.purple,
        accentColor: Colors.yellowAccent,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "Appbar",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ),
          color: Colors.purple
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontFamily: "Text"
          )
        ),
      ),
      home: PersonalExpenses(),
    );
  }
}

class PersonalExpenses extends StatefulWidget {

  @override
  _PersonalExpensesState createState() => _PersonalExpensesState();
}


class _PersonalExpensesState extends State<PersonalExpenses> {
  List<Expense> _userExpense = [
    Expense(100, "Shoes", DateTime.now(), DateTime.now().toString()),
    Expense(1000, "Groceries", DateTime.now(), DateTime.now().toString())
  ];

  void addExpense(Expense e) {
    _userExpense.add(e);
    setState(() {

    });
  }

  void startAddExpense() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return AddExpense(addExpense);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddExpense();
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              startAddExpense();
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
        title: Text(
          "Personal expenses"
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "CHART!"
                ),
              ),
            ),
            ExpenseList(userExpenses: _userExpense,)
          ],
        ),
      ),
    );
  }
}
