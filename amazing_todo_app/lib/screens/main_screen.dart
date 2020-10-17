import 'package:amazing_todo_app/providers/auth_model.dart';
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
          title: Text(title),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () => logOut(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  logOut(context) {
    Provider.of<AuthModel>(context, listen: false).resetToken();
    Navigator.pop(context);
  }
}
