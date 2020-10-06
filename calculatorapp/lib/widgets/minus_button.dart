import 'package:calculatorapp/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinusButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('-'),
      onPressed: () {
        Provider.of<CalculatorInputModel>(context, listen: false).minus();
      },
    );
  }
}
