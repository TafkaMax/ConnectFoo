import 'package:Kalkulator/enums/operators.dart';
import 'package:Kalkulator/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenericOperationButton extends StatelessWidget {
  final String operation;

  GenericOperationButton({@required this.operation});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(
          operation,
          style: Theme.of(context).textTheme.button,
        ),
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: () {
          getOperation(context, operation);
        });
  }

  void getOperation(BuildContext context, String operation) {
    switch (operation) {
      case "/":
        return Provider.of<CalculatorInputModel>(context, listen: false)
            .divide();
      case "+":
        return Provider.of<CalculatorInputModel>(context, listen: false).plus();
      case "-":
        return Provider.of<CalculatorInputModel>(context, listen: false)
            .minus();
      case "*":
        return Provider.of<CalculatorInputModel>(context, listen: false)
            .multiply();
    }
  }
}

// Provider.of<CalculatorInputModel>(context, listen: true)
//                   .currentOperator !=
//               Operators.empty
//           ? null
//           : () => (getOperation(
//                 context,
//                 operation,
//               )),
