import 'dart:convert';
import 'dart:io';

import 'package:amazing_todo_app/domain/todo_task.dart';
import 'package:amazing_todo_app/enums/notifier_state.dart';
import 'package:amazing_todo_app/environment_config.dart';
import 'package:amazing_todo_app/helpers/api_manager.dart';
import 'package:amazing_todo_app/helpers/custom_exception.dart';

import 'package:flutter/material.dart';

class TodoTaskProvider with ChangeNotifier {
  TodoTaskProvider() {
    _todoTasks = List();
  }

  List<TodoTask> _todoTasks;
  List<TodoTask> get todoTasks => _todoTasks;
  void _setTodoTasks(List<TodoTask> todoTasks) {
    _todoTasks = todoTasks;
  }

  void returnToPreviousPage() {
    _setCustomException(null);
    _setState(NotifierState.initial);
  }

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

  void addTodoTask(String jwt, String name, int sort, DateTime dueDate) async {
    _setCustomException(null);
    _setState(NotifierState.loading);

    DateTime insertDate = new DateTime.now();

    var body;
    if (dueDate == null) {
      body = {
        "todoTaskName": name,
        "todoTaskSort": sort,
        "dueDT": dueDate,
        "createdDT": insertDate.toIso8601String(),
        "todoCategoryId": 276,
        "todoPriorityId": 231
      };
    } else {
      body = {
        "todoTaskName": name,
        "todoTaskSort": sort,
        "createdDT": insertDate.toIso8601String(),
        "todoCategoryId": 276,
        "todoPriorityId": 231
      };
    }

    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    try {
      await APIManager().postAPICall(
          EnvironmentConfig.BASE_URL + '/TodoTasks', headers, jsonEncode(body));
      getTodoTasks(jwt);
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }

  void getTodoTasks(String jwt) async {
    _setCustomException(null);
    _setState(NotifierState.loading);
    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    try {
      var response = await APIManager()
          .getApiCall(EnvironmentConfig.BASE_URL + '/TodoTasks', headers);

      List<dynamic> decodedResponse = jsonDecode(response);

      List<TodoTask> todoCategories = decodedResponse
          .map((todotask) => TodoTask.fromJson(todotask))
          .toList();

      _setTodoTasks(todoCategories);
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }

  void deleteTodoTask(String jwt, int id) async {
    _setCustomException(null);
    _setState(NotifierState.loading);
    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    try {
      var response = await APIManager().deleteApiCall(
          EnvironmentConfig.BASE_URL + '/TodoTasks' + "/" + id.toString(),
          headers);
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }

  void putTodoTask(String jwt, int id, TodoTask todoTaskToUpdate) async {
    _setCustomException(null);
    _setState(NotifierState.loading);
    print(todoTaskToUpdate.createdDT);
    print(todoTaskToUpdate.dueDT);
    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    print(todoTaskToUpdate);
    Map<String, dynamic> postBody = TodoTask().toPostJson(todoTaskToUpdate);

    print(postBody);

    try {
      var response = await APIManager().putApiCall(
          EnvironmentConfig.BASE_URL + '/TodoTasks' + "/" + id.toString(),
          headers,
          jsonEncode(postBody));
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }
}
