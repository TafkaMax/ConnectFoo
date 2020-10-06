import 'package:calculatorapp/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(fontFamily: 'Digital7'),
      home: CalculatorScreen(),
    );
  }
}
