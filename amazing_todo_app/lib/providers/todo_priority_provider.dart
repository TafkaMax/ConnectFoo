import 'dart:convert';
import 'dart:io';

import 'package:amazing_todo_app/domain/todo_priority.dart';
import 'package:amazing_todo_app/enums/notifier_state.dart';
import 'package:amazing_todo_app/environment_config.dart';
import 'package:amazing_todo_app/helpers/api_manager.dart';
import 'package:amazing_todo_app/helpers/custom_exception.dart';

import 'package:flutter/material.dart';

class TodoPriorityProvider with ChangeNotifier {
  String _endPointUrl = '/TodoPriorities';
  List<TodoPriority> _todoPriorities;
  void _setTodoPriorities(List<TodoPriority> todoPriorities) {
    _todoPriorities = todoPriorities;
  }

  TodoPriorityProvider() {
    _todoPriorities = List();
  }

  void returnToPreviousPage() {
    _setCustomException(null);
    _setState(NotifierState.initial);
  }

  List<TodoPriority> get todoPriorities => _todoPriorities;
  CustomException _exception;
  CustomException get exception => _exception;
  void _setCustomException(CustomException exception) {
    _exception = exception;
    print(exception);
  }

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  void addTodoPriority(String jwt, String name, int sort) async {
    _setCustomException(null);
    _setState(NotifierState.loading);

    var body = {
      "todoPriorityName": name,
      "todoPrioritySort": sort,
    };

    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    try {
      await APIManager().postAPICall(
          EnvironmentConfig.BASE_URL + _endPointUrl, headers, jsonEncode(body));
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }

  void getTodoPriorities(String jwt) async {
    _setCustomException(null);
    _setState(NotifierState.loading);

    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    try {
      var response = await APIManager()
          .getApiCall(EnvironmentConfig.BASE_URL + _endPointUrl, headers);

      List<dynamic> decodedResponse = jsonDecode(response);

      List<TodoPriority> todoPriorities = decodedResponse
          .map((todocategory) => TodoPriority.fromJson(todocategory))
          .toList();

      _setTodoPriorities(todoPriorities);
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }

  void deleteTodoPriority(String jwt, int id) async {
    _setCustomException(null);
    _setState(NotifierState.loading);
    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    try {
      var response = await APIManager().deleteApiCall(
          EnvironmentConfig.BASE_URL + _endPointUrl + "/" + id.toString(),
          headers);
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }
}
