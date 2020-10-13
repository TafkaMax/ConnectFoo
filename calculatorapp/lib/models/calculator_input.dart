import 'dart:collection';

import 'package:Kalkulator/enums/operators.dart';

class CalculatorInput {
  //Private properties.
  String _currentInputForHistory = "";
  List<String> _calculatorHistory = new List();
  Queue<String> _currentInputQueue = new Queue();
  Queue<String> _currentCalculatedQueue = new Queue();
  String _currentInput = "";
  Operators _currentOperator = Operators.empty;
  String _defaultValue = "Error!";
  List<String> _displayInput = new List();

  //Getter methods for private props
  Queue<String> get currentInputQueue => _currentInputQueue;
  String get currentInput => _currentInput;
  Operators get currentOperator => _currentOperator;
  List<String> get calculatorHistory => _calculatorHistory;
  List<String> get displayInput => _displayInput;

  void addNumber(String input) {
    //Add number to display

    //if current operator is not empty make the currentinput equal input, so it changes visually

    //if current operator is empty then just add input to currentinput
    if (input == "0") {
      if (_currentInput.contains(".") || _currentInput.length == 0) {
        _currentInput += input;
        _currentInputForHistory += input;
        _displayInput.add(input);
      }
    } else {
      _currentInput += input;
      _currentInputForHistory += input;
      _displayInput.add(input);
    }
  }

  void addDecimal() {
    if (!_currentInput.contains('.')) {
      _currentInput += '.';
      _displayInput.add('.');
      _currentInputForHistory += '.';
    }
  }

  void backSpace() {
    if (_currentInput.length != 0) {
      _currentInput = _currentInput.replaceRange(
          _currentInput.length - 1, _currentInput.length - 0, "");
      _currentInputForHistory = _currentInputForHistory.replaceRange(
          _currentInputForHistory.length - 1,
          _currentInputForHistory.length - 0,
          "");
      _displayInput.removeLast();
    }
  }

  //clears current entry, operator still stays the same
  void clearEntry() {
    for (var i = 0; i < _currentInput.length; i++) {
      _displayInput.removeLast();
    }
    _currentInput = "";
    _currentOperator = Operators.empty;
  }

  //clears whole memory
  void clear() {
    _currentInput = "";
    _currentInputForHistory = "";
    _displayInput.clear();
    _currentInputQueue.clear();
    _currentCalculatedQueue.clear();
    _currentOperator = Operators.empty;
  }

  void addOperator(Operators operators) {
    _currentInputQueue.add(_currentInput);
    addPreviousOperatorToQueue();
    _currentOperator = operators;
    _displayInput.add(getCurrentOperatorString());
    _currentInputForHistory += getCurrentOperatorString();
    _currentInput = "";
  }

  void divide() {
    addOperator(Operators.divide);
  }

  void multiply() {
    addOperator(Operators.multiply);
  }

  void plus() {
    addOperator(Operators.add);
  }

  void minus() {
    addOperator(Operators.substract);
  }

  // https://stackoverflow.com/a/24085491
  bool isParsableAsDouble(String input) {
    if (input == null) {
      return false;
    }
    return double.tryParse(input) != null;
  }

  void doOperation(String op) {
    //Reverse polish notation in array: 2 5 + => removelast == 5 and removelast == 2, op is + .
    String op2 = _currentCalculatedQueue.removeLast();
    String op1 = _currentCalculatedQueue.removeLast();

    if (_currentOperator != Operators.empty) {
      if (op == "/") {
        double answer = double.parse(op1) / double.parse(op2);
        _currentCalculatedQueue.add(answer.toString());
      } else if (op == "+") {
        double answer = double.parse(op1) + double.parse(op2);
        _currentCalculatedQueue.add(answer.toString());
      } else if (op == "-") {
        double answer = double.parse(op1) - double.parse(op2);
        _currentCalculatedQueue.add(answer.toString());
      } else if (op == "*") {
        double answer = double.parse(op1) * double.parse(op2);
        _currentCalculatedQueue.add(answer.toString());
      }
    }
  }

  void equals() {
    //Add last input to queue
    _currentInputQueue.add(_currentInput);

    // if currentoperator is not empty add that operator to queue
    if (_currentOperator != Operators.empty) {
      _currentInputQueue.add(getCurrentOperatorString());
    }

    //while input queue is not empty
    while (_currentInputQueue.isNotEmpty) {
      //start moving from left to right
      String op = _currentInputQueue.removeFirst();
      //if op is not a double, then it is a operation and do an operation
      if (!isParsableAsDouble(op)) {
        doOperation(op);
      } else if (isParsableAsDouble(op)) {
        //if op is a double, add it to "checked" values
        _currentCalculatedQueue.add(op);
      }
    }
    //display the answer on dipslay
    _currentInput = _currentCalculatedQueue.removeLast();
    //reset operator after equals
    _currentInput = convertDoubleToInt(_currentInput);
    _currentInputForHistory += " =  $_currentInput";
    _calculatorHistory.add(_currentInputForHistory);
    _currentInputForHistory = _currentInput;
    _displayInput.clear();
    _displayInput.add(_currentInput);
    _currentOperator = Operators.empty;
  }

  //Returns operator string for enum
  String getCurrentOperatorString() {
    switch (_currentOperator) {
      case Operators.add:
        return "+";
        break;
      case Operators.substract:
        return "-";
        break;
      case Operators.divide:
        return "/";
        break;
      case Operators.multiply:
        return "*";
        break;
      case Operators.empty:
        return "";
        break;
      default:
        return "";
    }
  }

  //adds previous operator to queue
  void addPreviousOperatorToQueue() {
    if (_currentOperator != Operators.empty) {
      _currentInputQueue.add(getCurrentOperatorString());
    }
  }

  bool isInteger(num value) => value is int || value == value.roundToDouble();

  String convertDoubleToInt(String currentInput) {
    var value = double.tryParse(currentInput) ?? _defaultValue;

    if (value != _defaultValue) {
      if (isInteger(value)) {
        double doubleValue = value;
        int newValue = doubleValue.floor();
        return newValue.toString();
      }
    }
    return value.toString();
  }
}
