import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_demo',
      home: Scaffold(
        body: Center(
          child: SimpleCounter(),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label);
  }
}

class SimpleCounter extends StatefulWidget {
  const SimpleCounter();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SimpleCounter();
  }
}

class _SimpleCounter extends State<SimpleCounter> {
  double count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            transform: Matrix4.rotationX(count),
            child: Text('Counter is at ' + this.count.toString())),
        RaisedButton(
          onPressed: () {
            setState(() {
              this.count++;
            });
          },
          child: Text('Add one'),
        )
      ],
    );
  }
}
