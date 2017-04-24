// Copyright (c) 2017, Damon Douglas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'package:smartsheet/smartsheet_client.dart' show SmartsheetApi;
import 'package:smartsheet/smartsheet.dart' as smartsheet;

main() async {
  var configDataAsString = await HttpRequest.getString('config.json');
  var data = JSON.decode(configDataAsString);
  var token = data['api_key'];
  var api = new SmartsheetApi('bf75f382.ngrok.io', token);
  smartsheet.User user = await api.getCurrentUser();
  print(user.toJson());
  querySelector('#output').text = 'Your Dart app is running.';
}
