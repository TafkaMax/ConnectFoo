import 'dart:collection';

import 'package:calculatorapp/enums/operators.dart';
import 'package:calculatorapp/models/calculator_input.dart';
import 'package:flutter/material.dart';

class CalculatorInputModel with ChangeNotifier {
  final _calculatorInput = CalculatorInput();

  Queue<String> get inputs => _calculatorInput.currentInputQueue;
  String get currentInput => _calculatorInput.currentInput;
  Operators get currentOperator => _calculatorInput.currentOperator;

  void addNumber(String input) {
    _calculatorInput.addNumber(input);
    notifyListeners();
  }

  void clearEntry() {
    _calculatorInput.clearEntry();
    notifyListeners();
  }

  void clear() {
    _calculatorInput.clear();
    notifyListeners();
  }

  void addDecimal() {
    _calculatorInput.addDecimal();
    notifyListeners();
  }

  void divide() {
    _calculatorInput.divide();
    notifyListeners();
  }

  void multiply() {
    _calculatorInput.multiply();
    notifyListeners();
  }

  void equals() {
    _calculatorInput.equals();
    notifyListeners();
  }

  void backspace() {
    _calculatorInput.backSpace();
    notifyListeners();
  }

  void plus() {
    _calculatorInput.plus();
    notifyListeners();
  }

  void minus() {
    _calculatorInput.minus();
    notifyListeners();
  }
}
