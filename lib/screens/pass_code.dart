import 'package:expense/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/dimension.dart';

class PassCode extends StatefulWidget {
  const PassCode({super.key});

  @override
  State<PassCode> createState() => _PassCodeState();
}

class _PassCodeState extends State<PassCode> {
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle:const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color:const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color:const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color:const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(

      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CategoryScreen(),));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text('Pass Code'),
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.orangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        )),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pinput(
                  controller: _passController,
                  showCursor: true,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  length: 4,

                ),
              ],
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () async{
                Navigator.pop(context);
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setInt('pin', int.parse(_passController.text));
                prefs.setBool('isPass', true);
              },
              child: Container(
                height: 50,
                width: 150,
                alignment: Alignment.center,
                decoration:BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.blue,
                    Colors.orangeAccent
                  ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(10)
                ),
                child:const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
