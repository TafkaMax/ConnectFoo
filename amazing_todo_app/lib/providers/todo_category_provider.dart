import 'dart:convert';
import 'dart:io';

import 'package:amazing_todo_app/domain/todo_category.dart';
import 'package:amazing_todo_app/enums/notifier_state.dart';
import 'package:amazing_todo_app/environment_config.dart';
import 'package:amazing_todo_app/helpers/api_manager.dart';
import 'package:amazing_todo_app/helpers/custom_exception.dart';
import 'package:amazing_todo_app/services/todo_category_service.dart';

import 'package:flutter/material.dart';

class TodoCategoryProvider with ChangeNotifier {
  List<TodoCategory> _todoCategories;
  void _setTodoCategories(List<TodoCategory> todoCategories) {
    _todoCategories = todoCategories;
  }

  TodoCategoryServiceMapper _service;

  TodoCategoryProvider() {
    _service = TodoCategoryServiceMapper('/TodoCategories');
    _todoCategories = List();
  }

  void returnToPreviousPage() {
    _setCustomException(null);
    _setState(NotifierState.initial);
  }

  List<TodoCategory> get todoCategories => _todoCategories;
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

  void addTodoCategory(String jwt, String name, int sort) async {
    _setCustomException(null);
    _setState(NotifierState.loading);

    var body = {
      "todoCategoryName": name,
      "todoCategorySort": sort,
    };

    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    try {
      await APIManager().postAPICall(
          EnvironmentConfig.BASE_URL + '/TodoCategories',
          headers,
          jsonEncode(body));
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }

  void getTodoCategories(String jwt) async {
    _setCustomException(null);
    _setState(NotifierState.loading);
    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    try {
      var response = await APIManager()
          .getApiCall(EnvironmentConfig.BASE_URL + '/TodoCategories', headers);

      List<dynamic> decodedResponse = jsonDecode(response);

      List<TodoCategory> todoCategories = decodedResponse
          .map((todocategory) => TodoCategory.fromJson(todocategory))
          .toList();

      _setTodoCategories(todoCategories);
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }

  void deleteTodoCateogry(String jwt, int id) async {
    _setCustomException(null);
    _setState(NotifierState.loading);
    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt
    };

    try {
      var response = await APIManager().deleteApiCall(
          EnvironmentConfig.BASE_URL + '/TodoCategories' + "/" + id.toString(),
          headers);
    } on CustomException catch (e) {
      _setCustomException(e);
    }

    _setState(NotifierState.loaded);
  }
}
