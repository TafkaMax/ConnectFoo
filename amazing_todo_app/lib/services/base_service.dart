import 'dart:convert';
import 'dart:io';

import 'package:amazing_todo_app/environment_config.dart';
import 'package:amazing_todo_app/helpers/api_manager.dart';

// all of the converting is done here
class BaseService {
  String _apiUrl;
  Map<String, String> _headers;
  String _endpath;
  APIManager _apiManager;

  BaseService(this._endpath) {
    _apiUrl = EnvironmentConfig.BASE_URL;
    _headers = {HttpHeaders.authorizationHeader: "application/json"};
    _apiManager = APIManager();
  }

  Future<Map<String, dynamic>> addObject(
      Map<String, dynamic> object, String jwt) async {
    String body = jsonEncode(object);
    Map headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + jwt.toString()
    };

    print("got here");
    // var response =
    await _apiManager.postAPICall(_apiUrl + _endpath, headers, body);

    print('got here2');

    // Map<String, dynamic> map = jsonDecode(response);

    // print(map);

    // return map;
  }

  Future<Map<String, dynamic>> deleteObject(String id, String jwt) async {
    // TODO: implement deleteObject
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> getAll(String jwt) async {
    Map headers = {"JWT": "Bearer " + jwt.toString()};
    var response = await APIManager().getApiCall(_apiUrl + _endpath, headers);

    Map<String, dynamic> decodedResponse = jsonDecode(response);

    return response;
  }

  Future<Map<String, dynamic>> getById(String id, String jwt) async {
    // TODO: implement getById
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> updateObject(
      Map<String, dynamic> object, String jwt) async {
    // TODO: implement updateObject
    throw UnimplementedError();
  }
}
