import 'package:Kalkulator/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorDisplay extends StatelessWidget {
  final BoxConstraints boxConstraints;

  CalculatorDisplay({@required this.boxConstraints});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorInputModel>(
      builder: (context, calculatorinputmodel, child) {
        return Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(
            minWidth: boxConstraints.maxWidth,
            // fontsize is 30, padding is 10, so 50 is needed for it not change size if empty
            minHeight: Theme.of(context).textTheme.bodyText1.fontSize + 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              width: 3,
              color: Colors.blueGrey,
            ),
            color: Colors.grey.withOpacity(0.9),
          ),
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: 1,
            runSpacing: 3,
            children: calculatorinputmodel.displayInput
                .map(
                  (op) => (new Text(
                    op,
                    style: Theme.of(context).textTheme.bodyText1,
                    softWrap: true,
                  )),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
