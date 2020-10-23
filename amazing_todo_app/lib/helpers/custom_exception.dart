import 'dart:convert';

class CustomException implements Exception {
  dynamic _message;
  final _prefix;

  CustomException([this._message, this._prefix]) {
    Map<String, dynamic> response = jsonDecode(_message);
    if (response.containsKey("errors")) {
      response.forEach((key, value) {
        if (key == "errors") {
          _message = "";
          value.forEach((key, value) {
            for (dynamic errormessage in value) {
              _message += errormessage;
            }
          });
        }
      });
    }
  }

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class ForbiddenException extends CustomException {
  ForbiddenException(message) : super(message, "Forbidden: ") {
    this._message = "invalid Email or password";
  }
}

class UnauthorizedException extends CustomException {
  UnauthorizedException([message]) : super("Unauthorized: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class InternalServerException extends CustomException {
  InternalServerException([message]) : super(message, "Error in server: ");
}

class NotAcceptableException extends CustomException {
  NotAcceptableException([message]) : super(message, "Not acceptable: ") {
    this._message = "Email already registered";
  }
}
