import 'package:Kalkulator/providers/calculator_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDownMenu extends StatelessWidget {
  final String dropDownValue = "Menu";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropDownValue,
      items: [
        DropdownMenuItem(
          value: "Menu",
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        DropdownMenuItem(
          value: "History",
          child: Icon(
            Icons.history,
            color: Colors.black,
          ),
        ),
      ],
      iconDisabledColor: Colors.grey,
      style: TextStyle(),
      onChanged: (value) {
        if (value == "History") {
          Navigator.pushNamed(
            context,
            '/history',
            arguments: Provider.of<CalculatorInputModel>(context, listen: false)
                .calculatorHistory,
          );
        }
      },
      dropdownColor: Colors.amber,
    );
  }
}
