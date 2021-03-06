import 'package:amazing_todo_app/screens/login_screen.dart';
import 'package:amazing_todo_app/screens/main_screen.dart';
import 'package:amazing_todo_app/screens/todo_category_screen.dart';
import 'package:amazing_todo_app/screens/todo_priority_create_screen.dart';
import 'package:amazing_todo_app/screens/todo_task_create_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case "/main":
        return MaterialPageRoute(
          builder: (context) => MainScreen(
            title: args,
          ),
        );
      case "/categories":
        return MaterialPageRoute(builder: (context) => TodoCategoryScreen());
      case "/todo":
        return MaterialPageRoute(builder: (context) => TodoTaskCreateScreen());
      case "/priorities":
        return MaterialPageRoute(
            builder: (context) => TodoPriorityCreateScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }
}
