import 'package:Kalkulator/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EqualsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(
          '=',
          style: Theme.of(context).textTheme.button,
        ),
        onPressed: () {
          Provider.of<CalculatorInputModel>(context, listen: false).equals();
        });
  }
}
