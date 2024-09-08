import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseBuilder extends StatelessWidget {
  ExpenseBuilder({
    super.key,
    required this.expenses,
    required this.e1,
  });

  List<ExpenseModel> expenses;
  Function(ExpenseModel) e1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: items,
    );
  }

  Widget? items(BuildContext context, int sayi) {
    return Dismissible(
      onDismissed: (direction) {
        e1(expenses[sayi]);
      },
      key: ValueKey(expenses[sayi]),
      child: ExpenseItem(
        e1: expenses[sayi], 
      ),
    );
  }
}
