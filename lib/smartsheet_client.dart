library smartsheet.client;

import 'dart:async';
import 'dart:convert';
import 'package:http/browser_client.dart' as http;
import 'package:smartsheet/src/model.dart' as smartsheet;

class SmartsheetApi {
  String rootUrl;
  String servicePath = 'smartsheet';
  Map get commonHeaders => {'Authorization': 'Bearer $token'};
  String token;

  SmartsheetApi(this.rootUrl, this.token);

  Future<smartsheet.User> getCurrentUser() async {
    var client = new http.BrowserClient();
    var uri = _buildUri("users/me", {});
    var response = await client.get(uri, headers: commonHeaders);
    var body = response.body;
    var data = JSON.decode(body);
    return new smartsheet.User.fromJson(data);
  }

  Uri _buildUri(String methodPath, Map parameters) => parameters.isNotEmpty
      ? new Uri.https(rootUrl, "$servicePath/$methodPath", parameters)
      : new Uri.https(rootUrl, "$servicePath/$methodPath");
}
