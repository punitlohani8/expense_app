import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../constants/dimension.dart';
import '../models/database_provider.dart';
import '../constants/icons.dart';
import '../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _date;
  String _initialValue = 'Other';

  //
  _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(Dimensions.height20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // title
            TextField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Title of expense',
              ),
            ),
            SizedBox(height: Dimensions.height20),
            // amount
            TextField(
              controller: _amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount of expense',
              ),
            ),
            SizedBox(height: Dimensions.height20),
            // date picker
            Row(
              children: [
                Expanded(
                  child: Text(_date != null
                      ? DateFormat('MMMM dd, yyyy').format(_date!)
                      : 'Select Date'),
                ),
                IconButton(
                  onPressed: () => _pickDate(),
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height20),
            // category
            Row(
              children: [
                const Expanded(child: Text('Category')),
                Expanded(
                  child: DropdownButton(
                    items: icons.keys
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    value: _initialValue,
                    onChanged: (newValue) {
                      setState(() {
                        _initialValue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height20),
            Container(
              decoration:  BoxDecoration(
                  gradient:const LinearGradient(colors: [
                    Colors.blue,
                    Colors.orangeAccent
                  ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(Dimensions.radius10)
              ),
              child: ElevatedButton.icon(
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0.0),

                ),
                onPressed: () {
                  if (_title.text != '' && _amount.text != '') {
                    // create an expense
                    final file = Expense(
                      id: 0,
                      title: _title.text,
                      amount: double.parse(_amount.text),
                      date: _date != null ? _date! : DateTime.now(),
                      category: _initialValue,
                    );
                    // add it to database.
                    provider.addExpense(file);
                    // close the bottomsheet
                    Navigator.of(context).pop();
                  }
                },
                
                icon: const Icon(Icons.add),
                label: const Text('Add Expense'),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
