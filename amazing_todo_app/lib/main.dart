import 'package:amazing_todo_app/material_app.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:amazing_todo_app/providers/theme_data_provider.dart';
import 'package:amazing_todo_app/providers/todo_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AmazingTodoApp());
}

class AmazingTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthModel>(
          create: (_) => AuthModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TodoCategoryProvider(),
        )
      ],
      child: AmazingTodoMaterialApp(),
    );
  }
}
