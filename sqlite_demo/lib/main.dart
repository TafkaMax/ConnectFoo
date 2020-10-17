import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_demo/providers/auth_model.dart';
import 'package:sqlite_demo/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (_) => AuthModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          // '/main': (context) => MainScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Text('OK'),
      ),
    );
  }
}
