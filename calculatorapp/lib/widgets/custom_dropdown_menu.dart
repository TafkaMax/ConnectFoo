import 'package:Kalkulator/screens/calculator_history_screen.dart';
import 'package:flutter/material.dart';

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  CalculatorHistoryScreen(listOfCalculatorHistory: null),
            ),
          );
        }
      },
      dropdownColor: Colors.amber,
    );
  }
}
