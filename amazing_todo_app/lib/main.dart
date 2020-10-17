import 'package:amazing_todo_app/material_app.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AmazingTodoApp());
}

class AmazingTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (_) => AuthModel(),
      child: AmazingTodoMaterialApp(),
    );
  }
}
