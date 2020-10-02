import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/counter_model.dart';

class SingleBit extends StatelessWidget {
  final int bitNo;

  const SingleBit({@required this.bitNo});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, countermodel, child) {
        return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  getBitStr(countermodel),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.plus_one,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    addToBit(countermodel);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.exposure_minus_1,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                )
              ],
            ));
      },
    );
  }

  String getBitStr(CounterModel counterModel) {
    switch (bitNo) {
      case 0:
        return counterModel.bit0 ? '1' : '0';
      case 1:
        return counterModel.bit0 ? '1' : '0';
      case 2:
        return counterModel.bit0 ? '1' : '0';
    }

    return 'X';
  }

  void addToBit(CounterModel counterModel) {
    switch (bitNo) {
      case 0:
        counterModel.addToBit0();
        break;
      case 1:
        counterModel.addToBit1();
        break;
      case 2:
        counterModel.addToBit2();
        break;
    }
  }
}
