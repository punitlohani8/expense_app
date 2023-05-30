import 'dart:async';

import 'package:expense/constants/dimension.dart';
import 'package:expense/screens/pass_code.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'category_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const CategoryScreen()));
      // (getIsPassWord())?const PassCode(): const CategoryScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: Lottie.asset('assets/json/animation.json'),
          ),

          Text('ExpenceMate', style: TextStyle(fontWeight: FontWeight.bold,fontSize: Dimensions.font26,color: Colors.orangeAccent),),
          Text('Version 1.0.0', style: TextStyle(fontWeight: FontWeight.bold,fontSize: Dimensions.font12,color: Colors.white60),),


        ],
      ),
    );
  }
}
