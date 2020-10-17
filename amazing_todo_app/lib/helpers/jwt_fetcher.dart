import 'dart:convert';

import 'package:amazing_todo_app/domain/jwt.dart';
import 'package:amazing_todo_app/enums/form_type.dart';
import 'package:amazing_todo_app/environment_config.dart';
import 'package:http/http.dart' as http;

Future<JWT> fetchToken(String email, String password, FormType action) async {
  Map<String, String> headers = {"Content-Type": "application/json"};

  final response = await http.post(
    EnvironmentConfig.BASE_URL + '/account/${getFormTypeString(action)}',
    headers: headers,
    body: jsonEncode({
      "email": email,
      "password": password,
    }),
  );

  if (response.statusCode == 200) {
    return JWT.fromJson(json.decode(response.body));
  } else {
    return JWT(token: "", status: response.reasonPhrase);
  }
}
