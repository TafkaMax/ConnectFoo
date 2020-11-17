import 'package:amazing_todo_app/providers/todo_task_provider.dart';
import 'package:amazing_todo_app/states/custom_fab.dart';
import 'package:amazing_todo_app/widgets/pop_up_menu.dart';
import 'package:amazing_todo_app/widgets/todo_task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Expanded(child: TodoTaskList()),
          ],
        ),
        floatingActionButton: CustomFab(),
      ),
    );
  }

  // Widget _buildTodoCategories(context) {
  //   return ElevatedButton(
  //     onPressed: () {
  //       Navigator.pushNamed(context, "/categories").then(
  //         (value) => Provider.of<TodoTaskProvider>(context, listen: false)
  //             .returnToPreviousPage(),
  //       );
  //     },
  //     child: Text("Go to categories"),
  //   );
  // }

  // Widget _buildFloatingActionButton(BuildContext context) {
  //   return FloatingActionButton(
  //     onPressed: () {
  //       //Add create - opens a window
  //     },
  //     child: Icon(Icons.create),
  //   );
  // }
}
