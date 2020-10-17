import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthModel with ChangeNotifier {
  String _tokenkey = "";
  final storage = new FlutterSecureStorage();

  void updateToken(String key, dynamic value) async {
    await storage.write(key: key, value: value);
    notifyListeners();
  }

  void resetToken() async {
    await storage.delete(key: _tokenkey);
    notifyListeners();
  }

  Future<String> getToken() async {
    return await storage.read(key: _tokenkey);
  }
}

// / Read value
// String value = await storage.read(key: key);

// // Read all values
// Map<String, String> allValues = await storage.readAll();

// // Delete value
// await storage.delete(key: key);

// // Delete all
// await storage.deleteAll();

// // Write value
// await storage.write(key: key, value: value);
