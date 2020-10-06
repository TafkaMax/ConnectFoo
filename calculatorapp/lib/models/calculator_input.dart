import 'dart:collection';

import 'package:calculatorapp/enums/operators.dart';

class CalculatorInput {
  //Private properties.
  Queue<String> _currentInputQueue = new Queue();
  Queue<String> _currentCalculatedQueue = new Queue();
  String _currentInput = "";
  Operators _currentOperator = Operators.empty;
  String _defaultValue = "Error!";

  //Getter methods for private props
  Queue<String> get currentInputQueue => _currentInputQueue;
  String get currentInput => _currentInput;
  Operators get currentOperator => _currentOperator;

  void addNumber(String input) {
    //Add number to display

    //if current operator is not empty make the currentinput equal input, so it changes visually
    if (_currentOperator != Operators.empty) {
      _currentInput = input;
    } else {
      //if current operator is empty then just add input to currentinput
      _currentInput += input;
    }
  }

  void addDecimal() {
    if (!_currentInput.contains('.')) {
      _currentInput += '.';
    }
  }

  //clears current entry, operator still stays the same
  void clearEntry() {
    _currentInput = "";
  }

  //clears whole memory
  void clear() {
    _currentInput = "";
    _currentInputQueue.clear();
    _currentCalculatedQueue.clear();
    _currentOperator = Operators.empty;
  }

  void divide() {
    _currentInputQueue.add(_currentInput);
    addPreviousOperatorToQueue();
    _currentOperator = Operators.divide;
  }

  void multiply() {
    _currentInputQueue.add(_currentInput);
    addPreviousOperatorToQueue();
    _currentOperator = Operators.multiply;
  }

  void plus() {
    _currentInputQueue.add(_currentInput);
    addPreviousOperatorToQueue();
    _currentOperator = Operators.add;
  }

  void minus() {
    _currentInputQueue.add(_currentInput);
    addPreviousOperatorToQueue();
    _currentOperator = Operators.substract;
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
    _currentInput = checkDoubleFloor(_currentInput);
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

  String checkDoubleFloor(String currentInput) {
    var value = double.tryParse(currentInput) ?? _defaultValue;
    print(value);

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
