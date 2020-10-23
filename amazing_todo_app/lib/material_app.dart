import 'package:amazing_todo_app/providers/theme_data_provider.dart';
import 'package:amazing_todo_app/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmazingTodoMaterialApp extends StatelessWidget {
  static const mainColor = const Color(0xffB8A081);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazing Todo',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: Provider.of<ThemeDataProvider>(context).themeData,
    );
  }
}

//Icons made by <a href="https://icon54.com/" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
