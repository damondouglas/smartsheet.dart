library smartsheet.client;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http show Client, Response;

final _authority = "api.smartsheet.com";
final _version = "2.0";
final _authorization = "Authorization";
final _bearer = "Bearer ";

class Client {
  Map commonHeaders;
  Client(String token) {
    commonHeaders = {
      _authorization: _bearer + token,
      'Content-Type': 'application/json'
    };
  }
  Future<Map> get(String unencodedPath, {Map queryParameters}) async {
    var client = new http.Client();
    var uri = _buildUri(unencodedPath, queryParameters);
    var response = await client.get(uri, headers: commonHeaders);
    return _convertFrom(response);
  }

  Future<Map> post(String unencodedPath, Map body,
      {Map queryParameters}) async {
    var client = new http.Client();
    var uri = _buildUri(unencodedPath, queryParameters);
    var response = await client.post(uri, headers: commonHeaders, body: body);
    return _convertFrom(response);
  }
}

Uri _buildUri(String unencodedPath, [Map queryParameters]) {
  var path = _version + unencodedPath;
  Uri uri;
  if (queryParameters != null && queryParameters.isNotEmpty)
    uri = new Uri.https(_authority, path, queryParameters);
  else
    uri = new Uri.https(_authority, path);

  return uri;
}

Map _convertFrom(http.Response response) => JSON.decode(response.body);
