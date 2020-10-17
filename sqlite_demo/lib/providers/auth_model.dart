import 'package:flutter/material.dart';

class AuthModel with ChangeNotifier {
  String _token = "";
  String get token => _token;

  void updateToken(String newToken) {
    _token = newToken;
    notifyListeners();
  }

  void resetToken() {
    _token = "";
    notifyListeners();
  }
}
