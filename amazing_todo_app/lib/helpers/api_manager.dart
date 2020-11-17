import 'package:amazing_todo_app/helpers/custom_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class APIManager {
  Future<dynamic> postAPICall(String url, Map headers, String body) async {
    print("Calling API: $url");
    print("Calling parameters: $body");

    Map<String, String> _headers = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    if (headers != null) {
      _headers = headers;
    }

    var responseJson;

    try {
      final response = await http.post(url, headers: _headers, body: body);

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    // this needs to be decoded.
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 204:
        var responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
        throw UnauthorizedException(response.body);
      case 403:
        throw ForbiddenException(response.body);
      case 406:
        throw NotAcceptableException(response.body);
      case 500:
        throw InternalServerException(response.body);

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<dynamic> getApiCall(String url, Map headers) async {
    var responseJson;

    Map<String, String> _headers = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    _headers.addAll(headers);

    try {
      // print(_headers);
      final response = await http.get(url, headers: _headers);
      // print(response.body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> deleteApiCall(String url, Map headers) async {
    var responseJson;

    try {
      final response = await http.delete(url, headers: headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  putApiCall(String url, Map<String, String> headers, String body) async {
    var responseJson;

    try {
      final response = await http.put(url, headers: headers, body: body);

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    // this needs to be decoded.
    return responseJson;
  }
}
