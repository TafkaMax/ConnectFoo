import 'package:amazing_todo_app/enums/form_type.dart';
import 'package:amazing_todo_app/helpers/jwt_fetcher.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controllers for text input fields
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();

  //properties
  String _email = "";
  String _password = "";
  FormType _form = FormType.login;

  //Constructor
  _LoginScreenState() {
    textControllerEmail.addListener(_emailListener);
    textControllerPassword.addListener(_passwordListener);
  }

  //listeners for textcontrollers
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
      _password = textControllerPassword.text;
    }
  }

  void _formChange() {
    setState(() {
      _form = getFormType(_form);
    });
  }

  @override
  void dispose() {
    textControllerEmail.dispose();
    textControllerPassword.dispose();
    super.dispose();
  }

  void _buttonLoginRegisterPressed() async {
    var jwt = await fetchToken(_email, _password, _form);

    if (jwt.token.isNotEmpty) {
      Provider.of<AuthModel>(context, listen: false)
          .updateToken(_email, jwt.token);
      Navigator.pushNamed(context, '/main', arguments: "Amazing Todo");
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

  Widget _buildAppBar() {
    return AppBar(
      title: Text(getFormTypeString(_form)),
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
