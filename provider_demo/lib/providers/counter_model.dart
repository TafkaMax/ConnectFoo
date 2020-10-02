import 'package:flutter/widgets.dart';
import 'package:provider_demo/models/counter.dart';

class CounterModel with ChangeNotifier {
  final _counter = Counter();

  bool get bit0 => _counter.bit0;
  bool get bit1 => _counter.bit1;
  bool get bit2 => _counter.bit2;

  void addToBit0() {
    _counter.addToBit0();
    //inform the UI that state
    notifyListeners();
  }

  void addToBit1() {
    _counter.addToBit1();
    //inform the UI that state
    notifyListeners();
  }

  void addToBit2() {
    _counter.addToBit2();
    //inform the UI that state
    notifyListeners();
  }

  void add() {
    addToBit0();
  }

  void reset() {
    _counter.reset();
    notifyListeners();
  }
}
