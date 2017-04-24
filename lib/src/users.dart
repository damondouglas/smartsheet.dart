library smartsheet.users;

import 'dart:async';
import 'client.dart';

Future<Map> getCurrentUser(String token) async {
  var client = new Client(token);
  return client.get("/users/me");
}
