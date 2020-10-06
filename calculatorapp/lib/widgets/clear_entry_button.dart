import 'package:calculatorapp/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClearEntryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('CE'),
        onPressed: () {
          Provider.of<CalculatorInputModel>(context, listen: false)
              .clearEntry();
        });
  }
}
