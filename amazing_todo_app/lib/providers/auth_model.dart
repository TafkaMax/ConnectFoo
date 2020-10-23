import 'dart:convert';

import 'package:amazing_todo_app/domain/jwt.dart';
import 'package:amazing_todo_app/enums/form_type.dart';
import 'package:amazing_todo_app/enums/notifier_state.dart';
import 'package:amazing_todo_app/environment_config.dart';
import 'package:amazing_todo_app/helpers/api_manager.dart';
import 'package:amazing_todo_app/helpers/custom_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthModel with ChangeNotifier {
  String _tokenkey = "";

  String get tokenKey => _tokenkey;

  final storage = new FlutterSecureStorage();

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  CustomException _exception;
  CustomException get exception => _exception;
  void _setCustomException(CustomException exception) {
    _exception = exception;
    print(exception);
  }

  // update current token
  // FORMTYPE - LOGIN/REGISTER
  // KEY - EMAIL
  void updateToken(
      String email, String password, FormType form, String key) async {
    //activate spinner
    _setCustomException(null);
    _setState(NotifierState.loading);

    try {
      var body = {
        "email": email,
        "password": password,
      };

      var response = await APIManager().postAPICall(
          EnvironmentConfig.BASE_URL + '/account/${getFormTypeString(form)}',
          null,
          jsonEncode(body));

      JWT jwt = JWT.fromJson(jsonDecode(response));
      print(jwt.status);
      print(jwt.token);
      _setToken(jwt, key);
      _tokenkey = key;
    } on CustomException catch (f) {
      _setCustomException(f);
    }
    _setState(NotifierState.loaded);
  }

  // delete current token, key is email address
  void deleteToken() async {
    await storage.delete(key: _tokenkey);
    _setState(NotifierState.initial);
  }

  // delete all tokens (for debugging only!)
  void deleteAllTokens() async {
    await storage.deleteAll();
    notifyListeners();
  }

  //gets current JWT token using logged in email
  Future<String> getToken() async {
    String key = await storage.read(key: _tokenkey);
    print(key);
    return key;
    // return await storage.read(key: _tokenkey);
  }

  // set JWT to storage, key is email
  void _setToken(JWT jwt, String key) async {
    await storage.write(key: key, value: jwt.token);
  }
}
