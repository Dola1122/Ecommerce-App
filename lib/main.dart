import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/auth/register_screen.dart';
import 'package:ecommerce_app/view/budget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
      ),
      debugShowCheckedModeBanner: false,
      home: BudgetScreen(),
    );
  }
}
