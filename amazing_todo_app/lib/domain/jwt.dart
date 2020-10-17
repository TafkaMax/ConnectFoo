import 'package:flutter/widgets.dart';

class JWT {
  final String token;
  final String status;

  JWT({@required this.token, @required this.status});

  factory JWT.fromJson(Map<String, dynamic> jsonObject) {
    // if (jsonObject.containsKey(['token']) && jsonObject.containsKey('status')) {
    //   print('got here');
    return JWT(token: jsonObject['token'], status: jsonObject['status']);
    // } else {
    // return JWT(token: '', status: 'Response was not valid!');
    // }
  }
}
