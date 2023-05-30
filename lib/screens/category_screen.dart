import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../widgets/category_screen/category_fetcher.dart';
import '../widgets/expense_form.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const name = '/category_screen'; // for routes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Categories'
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.orangeAccent
              ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)

          ),
        ),
        centerTitle: true,
      ),
      body: const CategoryFetcher(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.blue,
            Colors.orangeAccent
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(color: Colors.grey,blurRadius: 7,offset:Offset(5,5))
          ]
        ),
        
        
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => const ExpenseForm(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      endDrawer: _drawer(),
    );
  }
  Drawer _drawer(){
    return Drawer(

      elevation: 11,
      child: ListView(
        children:[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Category'),
            trailing: IconButton(
              icon:Icon( Icons.add),
              onPressed: (){

              },
            ),
          ),
        ],
      ),
    );
  }

}

