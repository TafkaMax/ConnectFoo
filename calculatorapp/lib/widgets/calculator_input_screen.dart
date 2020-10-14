import 'package:Kalkulator/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorInputScreen extends StatelessWidget {
  final BoxConstraints boxConstraints;

  const CalculatorInputScreen({this.boxConstraints});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorInputModel>(
        builder: (context, calculatorinputmodel, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            width: 3,
            color: Colors.blueGrey,
          ),
          color: Colors.grey.withOpacity(0.5),
        ),
        constraints: BoxConstraints(
          minWidth: boxConstraints.maxWidth,
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          children: <Widget>[
            Text(
              calculatorinputmodel.currentInput,
              style: Theme.of(context).textTheme.headline1,
              softWrap: true,
            ),
          ],
        ),
      );
    });
  }
}
