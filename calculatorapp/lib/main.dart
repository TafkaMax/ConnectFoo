import 'package:Kalkulator/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        fontFamily: 'Digital7',
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        accentColor: Colors.redAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            side: BorderSide(
              color: Colors.amberAccent,
              width: 2,
              style: BorderStyle.solid,
            ),
            padding: EdgeInsets.symmetric(vertical: 9),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.blue,
                offset: Offset.fromDirection(4, 5.0),
                blurRadius: 5.0,
              ),
              Shadow(
                color: Colors.redAccent,
                offset: Offset.fromDirection(0, 5.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          headline2: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.blue,
                offset: Offset.fromDirection(4, 3.0),
                blurRadius: 3.0,
              ),
              Shadow(
                color: Colors.redAccent,
                offset: Offset.fromDirection(0, 3.0),
                blurRadius: 3.0,
              ),
            ],
          ),
          bodyText1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.blue,
                offset: Offset.fromDirection(4, 3.0),
                blurRadius: 3.0,
              ),
              Shadow(
                color: Colors.redAccent,
                offset: Offset.fromDirection(0, 3.0),
                blurRadius: 3.0,
              ),
            ],
          ),
          button: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.blue,
                offset: Offset.fromDirection(4, 3.0),
                blurRadius: 3.0,
              ),
              Shadow(
                color: Colors.redAccent,
                offset: Offset.fromDirection(0, 3.0),
                blurRadius: 3.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
