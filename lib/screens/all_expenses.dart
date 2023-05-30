import 'package:flutter/material.dart';
import '../widgets/all_expenses_screen/all_expenses_fetcher.dart';

class AllExpenses extends StatefulWidget {
  const AllExpenses({super.key});
  static const name = '/all_expenses';

  @override
  State<AllExpenses> createState() => _AllExpensesState();
}

class _AllExpensesState extends State<AllExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Expenses'),flexibleSpace: Container(
        decoration:const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.orangeAccent
            ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)

        ),
      ),centerTitle: true,),
      body: const AllExpensesFetcher(),
    );
  }
}
