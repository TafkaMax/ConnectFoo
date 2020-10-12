import 'package:Kalkulator/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorHistoryScreen extends StatelessWidget {
  final List<String> listOfCalculatorHistory;

  CalculatorHistoryScreen({@required this.listOfCalculatorHistory});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (
      BuildContext context,
      Orientation orientation,
    ) {
      return Scaffold(
        appBar: AppBar(),
        body: ListView(),
      );
    });
  }
}
