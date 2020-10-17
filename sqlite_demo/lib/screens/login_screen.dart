import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_demo/domain/jwt.dart';
import 'package:http/http.dart' as http;
import 'package:sqlite_demo/providers/auth_model.dart';

Future<JWT> fetchToken(String email, String password, FormType action) async {
  Map<String, String> headers = {"Content-Type": "application/json"};

  final response = await http.post(
    'https://taltech.akaver.com/api/v1/account/${action == FormType.login ? 'login' : 'register'}',
    headers: headers,
    body: jsonEncode({
      "email": email,
      "password": password,
    }),
  );

  if (response.statusCode == 200) {
    return JWT.fromJson(json.decode(response.body));
  } else {
    return JWT(token: "", status: response.reasonPhrase);
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

enum FormType { login, register }

class _LoginScreenState extends State<LoginScreen> {
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();

  String _email = "";
  String _password = "";
  FormType _form = FormType.login;

  _LoginScreenState() {
    textControllerEmail.addListener(_emailListener);
    textControllerPassword.addListener(_passwordListener);
  }

  void _emailListener() {
    if (textControllerEmail.text.isEmpty) {
      _email = "";
    } else {
      _email = textControllerEmail.text;
    }
  }

  void _passwordListener() {
    if (textControllerPassword.text.isEmpty) {
      _password = "";
    } else {
      _password = textControllerEmail.text;
    }
  }

  void _formChange() {
    setState(() {
      _form = _form == FormType.login ? FormType.register : FormType.login;
      // if (_form == FormType.login) {
      //   _form = FormType.register;
      // } else {
      //   _form = FormType.login;
      // }
    });
  }

  void _buttonLoginRegisterPressed() async {
    var jwt = await fetchToken(_email, _password, _form);

    if (jwt.token.isNotEmpty) {
      Provider.of<AuthModel>(context, listen: false).updateToken(jwt.token);
      Navigator.pushNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: Column(
          children: [
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textControllerEmail.dispose();
    textControllerPassword.dispose();
    super.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(_form == FormType.login ? "Login" : "Register"),
    );
  }

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: [
          Container(
            child: TextField(
              controller: textControllerEmail,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            child: TextField(
              controller: textControllerPassword,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    var buttonLoginRegisterText =
        _form == FormType.login ? "Login" : "Register";

    var buttonChangeFormTypeText = _form == FormType.login
        ? "Do you need to register?"
        : "Already have an account switch to login";

    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _buttonLoginRegisterPressed,
            child: Text(buttonLoginRegisterText),
          ),
          TextButton(
            onPressed: _formChange,
            child: Text(buttonChangeFormTypeText),
          )
        ],
      ),
    );
  }
}
