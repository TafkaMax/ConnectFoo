// all of the converting is done here
import 'dart:io';

import 'package:amazing_todo_app/domain/todo_category.dart';
import 'package:amazing_todo_app/services/base_service.dart';

class TodoCategoryServiceMapper {
  BaseService _baseService;
  String _endpath;

  TodoCategoryServiceMapper(this._endpath) {
    this._baseService = BaseService(_endpath);
  }

  Future<TodoCategory> addObject(TodoCategory object, String jwt) async {
    Map<String, dynamic> postJson = object.toPostJson(object);

    await _baseService.addObject(postJson, jwt);

    // return TodoCategory.fromJson(map);
    // Map<String, dynamic> mapBody = TodoCategory().toPostJson(object);
    // Map headers = {HttpHeaders.authorizationHeader: "Bearer " + jwt.toString()};

    // String stringBody = jsonEncode(mapBody);

    // var response =
    //     await _apiManager.postAPICall(_apiUrl + _endpath, headers, stringBody);

    // Map<String, dynamic> map = jsonDecode(response);

    // TodoCategory responseObject = TodoCategory.fromJson(map);

    // return responseObject;
  }

  Future<TodoCategory> deleteObject(String id, String jwt) async {
    Map headers = {HttpHeaders.authorizationHeader: "Bearer " + jwt.toString()};

    //
  }

  // Future<List<TodoCategory>> getAll(String jwt) async {
  //   Map headers = {HttpHeaders.authorizationHeader: "Bearer " + jwt.toString()};

  //   var response = await _apiManager.getApiCall(_apiUrl + _endpath, headers);

  //   Map<String, dynamic> map = jsonDecode(response);

  //   print(map);

  Future<TodoCategory> getById(String id, String jwt) async {
    // Map headers = {HttpHeaders.authorizationHeader: "Bearer " + jwt.toString()};

    // int objectId = int.tryParse(id);
    // var response =
    //     await _apiManager.getApiCall(_apiUrl + _endpath + '$objectId', headers);

    // Map<String, dynamic> map = jsonDecode(response);

    // TodoCategory todoCategory = TodoCategory.fromJson(map);

    // return todoCategory;
  }

  // Future<TodoCategory> updateObject(TodoCategory object, String jwt) async {
  //   Map headers = {HttpHeaders.authorizationHeader: "Bearer " + jwt.toString()};

  //   Map<String, dynamic> mapBody = TodoCategory().toPostJson(object);

  //   String stringBody = jsonEncode(mapBody);

  //   var response = await _apiManager.putApiCall(_apiUrl + _endpath, mapBody, headers);

  //   Map<String, dynamic> map = jsonDecode(response);

  //   TodoCategory todoCategory = TodoCategory.fromJson(map);

  //   return todoCategory;
  // }
}
