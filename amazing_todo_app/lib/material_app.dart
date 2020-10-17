import 'package:amazing_todo_app/route_generator.dart';
import 'package:flutter/material.dart';

class AmazingTodoMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazing Todo',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        fontFamily: 'Assistant',
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.white10,
        disabledColor: Colors.grey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.white24,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: BorderSide(
              color: Colors.black26,
              width: 2,
              style: BorderStyle.solid,
            ),
            padding: EdgeInsets.symmetric(vertical: 9),
          ),
        ),
        // textTheme: TextTheme(),
        // textButtonTheme: TextButtonThemeData(),
      ),
    );
  }
}
