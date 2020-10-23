import 'package:amazing_todo_app/enums/form_type.dart';
import 'package:amazing_todo_app/enums/notifier_state.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:amazing_todo_app/widgets/pop_up_menu.dart';
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
  //key is also email for storing JWT
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
    Provider.of<AuthModel>(context, listen: false)
        .updateToken(_email, _password, _form, _email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: Column(
          children: [
            _buildTextFields(),
            _buildValidationField(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ImageIcon(
              new AssetImage("assets/icons/to-do-list.png"),
            ),
          ),
          Text(
            getFormTypeString(_form),
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
        ],
      ),
      actions: [buildPopUpMenu(context)],
    );
  }

  Widget _buildTextFields() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.none,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: TextFormField(
              controller: textControllerEmail,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Theme.of(context).primaryColor,
                ),
                labelText: "Email",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextFormField(
              controller: textControllerPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Theme.of(context).primaryColor,
                ),
                labelText: "Password",
              ),
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
        : "Already have an account switch to login.";

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
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Provider.of<AuthModel>(context, listen: false).deleteAllTokens();
          //   },
          //   child: Text(
          //     "delet all",
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildValidationField() {
    return Consumer<AuthModel>(builder: (context, authmodel, child) {
      if (authmodel.state == NotifierState.initial) {
        return Container();
      } else if (authmodel.state == NotifierState.loading) {
        return CircularProgressIndicator();
      } else {
        if (authmodel.exception != null) {
          return Text(
            authmodel.exception.toString(),
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          );
        } else {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pushNamed(context, '/main', arguments: "Amazing Todo");
          });
          return Text('Logged in successfully');
        }
      }
    });
  }
}
