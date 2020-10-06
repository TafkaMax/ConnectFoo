import 'package:calculatorapp/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackSpaceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Icon(
          Icons.backspace_outlined,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          Provider.of<CalculatorInputModel>(context, listen: false).backspace();
        });
  }
}
