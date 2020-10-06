import 'package:calculatorapp/providers/calculator_input_model.dart';
import 'package:calculatorapp/widgets/calculator_input_screen.dart';
import 'package:calculatorapp/widgets/clear_button.dart';
import 'package:calculatorapp/widgets/clear_entry_button.dart';
import 'package:calculatorapp/widgets/decimal_button.dart';
import 'package:calculatorapp/widgets/divide_button.dart';
import 'package:calculatorapp/widgets/equals_button.dart';
import 'package:calculatorapp/widgets/minus_button.dart';
import 'package:calculatorapp/widgets/multiplier_button.dart';
import 'package:calculatorapp/widgets/number_button.dart';
import 'package:calculatorapp/widgets/plus_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorInputModel>(
      create: (context) => CalculatorInputModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: CalculatorInputScreen(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClearButton(),
                  ClearEntryButton(),
                  DecimalButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(buttonnumber: 1),
                  NumberButton(buttonnumber: 2),
                  NumberButton(buttonnumber: 3),
                  PlusButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(buttonnumber: 4),
                  NumberButton(buttonnumber: 5),
                  NumberButton(buttonnumber: 6),
                  MinusButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(buttonnumber: 7),
                  NumberButton(buttonnumber: 8),
                  NumberButton(buttonnumber: 9),
                  DivideButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NumberButton(buttonnumber: 0),
                  MultiplierButton(),
                  EqualsButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
