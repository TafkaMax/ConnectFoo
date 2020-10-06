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
          centerTitle: true,
          title: Text(
            'Calculator',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
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
                    Expanded(
                      child: ClearButton(),
                    ),
                    Expanded(
                      child: ClearEntryButton(),
                    ),
                    Expanded(
                      child: DecimalButton(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: NumberButton(buttonnumber: 1),
                    ),
                    Expanded(
                      child: NumberButton(buttonnumber: 2),
                    ),
                    Expanded(
                      child: NumberButton(buttonnumber: 3),
                    ),
                    Expanded(
                      child: PlusButton(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: NumberButton(buttonnumber: 4),
                    ),
                    Expanded(
                      child: NumberButton(buttonnumber: 5),
                    ),
                    Expanded(
                      child: NumberButton(buttonnumber: 6),
                    ),
                    Expanded(
                      child: MinusButton(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: NumberButton(buttonnumber: 7),
                    ),
                    Expanded(
                      child: NumberButton(buttonnumber: 8),
                    ),
                    Expanded(
                      child: NumberButton(buttonnumber: 9),
                    ),
                    Expanded(
                      child: DivideButton(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: NumberButton(buttonnumber: 0),
                    ),
                    Expanded(
                      child: MultiplierButton(),
                    ),
                    Expanded(
                      child: EqualsButton(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
