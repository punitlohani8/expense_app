import 'package:expense/constants/dimension.dart';
import 'package:expense/screens/pass_code.dart';
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
      endDrawer: _drawer(context: context),
    );
  }
  Drawer _drawer({required BuildContext context}){
    return Drawer(

      elevation: 11,
      child: Container(
        decoration: BoxDecoration(
            gradient:const LinearGradient(colors: [
              Colors.blue,
              Colors.orangeAccent
            ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),

            boxShadow: [
              BoxShadow(color: Colors.grey,blurRadius: Dimensions.radius10,offset:Offset(Dimensions.radius5,Dimensions.radius5))
            ]
        ),
        child: ListView(
          children:[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(Dimensions.radius20))
              ),
              child: Column(
                children: [
                  Image(image:const AssetImage('assets/image/logo.jpg'),width: Dimensions.width150,height: Dimensions.height100,),

                  Text('ExpenseMate',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font26,
                    color: Colors.black
                  ),)

                ],
              ),
            ),
            ListTile(
              title: const Text('Category'),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: (){}
              ),
            ),
            ListTile(
              title: const Text('PassCode'),
              trailing: IconButton(
                icon : const Icon(Icons.lock),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PassCode(),));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}

