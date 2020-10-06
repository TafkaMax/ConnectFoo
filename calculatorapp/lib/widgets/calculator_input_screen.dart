import 'package:Kalkulator/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorInputModel>(
        builder: (context, calculatorinputmodel, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 3,
            color: Colors.amberAccent,
          ),
          color: Colors.amber,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              calculatorinputmodel.currentInput,
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.blue,
                    offset: Offset.fromDirection(4, 3.0),
                    blurRadius: 3.0,
                  ),
                  Shadow(
                    color: Colors.redAccent,
                    offset: Offset.fromDirection(0, 3.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    });
  }
}
