import 'package:amazing_todo_app/widgets/pop_up_menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String title;
  MainScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            title,
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
          actions: [buildPopUpMenu(context)],
        ),
        body: Column(
          children: [
            _buildTodoCategories(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTodoCategories(context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/categories");
      },
      child: Text("Go to categories"),
    );
  }
}
