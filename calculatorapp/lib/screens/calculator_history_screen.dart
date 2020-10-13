import 'package:flutter/material.dart';

class CalculatorHistoryScreen extends StatelessWidget {
  final List<String> calculatorHistory;

  CalculatorHistoryScreen({@required this.calculatorHistory});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (
      BuildContext context,
      Orientation orientation,
    ) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculator History",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: calculatorHistory.length > 0
              ? ListView.builder(
                  reverse: true,
                  itemCount: calculatorHistory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new ListTile(
                      leading: Icon(
                        Icons.history,
                        size: 35,
                        color: Colors.amber,
                      ),
                      title: Text(
                        calculatorHistory[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  })
              : Center(
                  child: Text(
                    'History is empty',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
        ),
      );
    });
  }
}
