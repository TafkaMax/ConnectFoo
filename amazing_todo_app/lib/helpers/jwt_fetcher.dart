import 'dart:convert';
import 'dart:io';

import 'package:amazing_todo_app/domain/jwt.dart';
import 'package:amazing_todo_app/domain/verification_exception.dart';
import 'package:amazing_todo_app/enums/form_type.dart';
import 'package:amazing_todo_app/environment_config.dart';
import 'package:http/http.dart' as http;

Future<JWT> fetchToken(String email, String password, FormType action) async {
  Map<String, String> headers = {"Content-Type": "application/json"};

  try {
    final response = await http.post(
      EnvironmentConfig.BASE_URL + '/account/${getFormTypeString(action)}',
      headers: headers,
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    print(response.statusCode);
    print(response.body);

    return JWT.fromJson(json.decode(response.body));
  } on SocketException {
    throw VerificationException("No internet connection");
  } on HttpException {
    throw VerificationException("Service is unavailable!");
  } on TypeError {
    throw VerificationException("Please input valid username and password");
  }

  // if (response.statusCode == 200) {

  // } else {
  //   return JWT(token: "", status: response.reasonPhrase);
  // }
}
