import 'package:expense_tracker/widgets/expensesList/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpenses),
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenses(Expense expense) {
    final expenseIndex=_registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text('Expense Deleted.'),
          action: SnackBarAction(label: 'Undo', onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),));
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(
      child: Text('No Expenses Found. Start Adding Some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      maincontent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpenses,
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpensesOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [Text('The Chart'), Expanded(child: maincontent)],
      ),
    );
  }
}
