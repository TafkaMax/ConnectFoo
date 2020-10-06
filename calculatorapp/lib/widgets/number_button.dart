import 'package:calculatorapp/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberButton extends StatelessWidget {
  final int buttonnumber;

  const NumberButton({@required this.buttonnumber});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(buttonnumber.toString()),
        onPressed: () {
          Provider.of<CalculatorInputModel>(context, listen: false)
              .addNumber(buttonnumber.toString());
        });
  }
}
