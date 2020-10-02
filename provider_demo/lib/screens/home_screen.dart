import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/counter_model.dart';
import 'package:provider_demo/widgets/button_dec.dart';
import 'package:provider_demo/widgets/button_inc.dart';
import 'package:provider_demo/widgets/button_reset.dart';
import 'package:provider_demo/widgets/single_bit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
      create: (context) => CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleBit(bitNo: 2),
                  SingleBit(bitNo: 1),
                  SingleBit(bitNo: 0),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ButtonInc(),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ButtonDec(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ButtonReset(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
