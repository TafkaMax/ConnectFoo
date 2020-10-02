import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/counter_model.dart';

class ButtonReset extends StatelessWidget {
  const ButtonReset({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('Reset'),
        onPressed: () {
          Provider.of<CounterModel>(context, listen: false).reset();
        });
  }
}
