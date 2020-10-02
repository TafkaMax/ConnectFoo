import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/counter_model.dart';

class ButtonInc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('Inc'),
        onPressed: () {
          Provider.of<CounterModel>(context, listen: false).add();
        });
  }
}
